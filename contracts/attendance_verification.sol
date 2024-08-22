// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttendanceSystem {
    // Structures
    struct Student {
        string name;
        address walletAddress;
        bool isEnrolled;
        bool isPresent;
    }

    struct Course {
        uint256 courseId;
        string courseName;
        address teacher;
        mapping(address => Student) students;
        mapping(address => bool) attendanceMarked;
        uint256 rewardAmount;
        string mainGeoLocation;  // Store as string (latitude,longitude)
    }

    // State Variables
    mapping(uint256 => Course) public courses;  // courseId to Course mapping
    uint256 public nextCourseId;

    // Events
    event CourseCreated(uint256 courseId, string courseName, address teacher);
    event StudentEnrolled(uint256 courseId, address studentAddress, string name);
    event AttendanceMarked(uint256 courseId, address studentAddress, string geoLocation);
    event RewardDistributed(uint256 courseId, address studentAddress, uint256 amount);

    // Modifiers
    modifier onlyTeacher(uint256 courseId) {
        require(msg.sender == courses[courseId].teacher, "Only teacher can perform this action");
        _;
    }

    modifier onlyProctorOrTeacher(uint256 courseId) {
        require(
            msg.sender == courses[courseId].teacher,
            "Only teacher or authorized proctor can perform this action"
        );
        _;
    }

    // Functions

    // Create a new course
    function createCourse(string memory courseName, string memory mainGeoLocation, uint256 rewardAmount) public {
        uint256 courseId = nextCourseId;
        Course storage newCourse = courses[courseId];
        newCourse.courseId = courseId;
        newCourse.courseName = courseName;
        newCourse.teacher = msg.sender;
        newCourse.mainGeoLocation = mainGeoLocation;
        newCourse.rewardAmount = rewardAmount;

        nextCourseId++;

        emit CourseCreated(courseId, courseName, msg.sender);
    }

    // Enroll a student in a course
    function enrollStudent(uint256 courseId, address studentAddress, string memory name) public onlyTeacher(courseId) {
        Course storage course = courses[courseId];
        course.students[studentAddress] = Student(name, studentAddress, true, false);

        emit StudentEnrolled(courseId, studentAddress, name);
    }

    // Mark attendance for a student
    function markAttendance(uint256 courseId, address studentAddress, string memory geoLocation) public onlyProctorOrTeacher(courseId) {
        Course storage course = courses[courseId];
        require(course.students[studentAddress].isEnrolled, "Student is not enrolled in this course");
        require(keccak256(abi.encodePacked(geoLocation)) == keccak256(abi.encodePacked(course.mainGeoLocation)), "GeoLocation does not match");
        
        course.students[studentAddress].isPresent = true;
        course.attendanceMarked[studentAddress] = true;

        emit AttendanceMarked(courseId, studentAddress, geoLocation);
    }

    // Distribute rewards to students
    function distributeRewards(uint256 courseId) public onlyTeacher(courseId) {
        Course storage course = courses[courseId];

        for (uint256 i = 0; i < nextCourseId; i++) {
            Student storage student = course.students[course.teacher];
            if (student.isEnrolled && student.isPresent) {
                payable(student.walletAddress).transfer(course.rewardAmount);
                emit RewardDistributed(courseId, student.walletAddress, course.rewardAmount);
            }
        }
    }

    // Function to fund the contract for rewards
    function fundContract() public payable {}

    // Function to withdraw funds (only by the teacher)
    function withdrawFunds(uint256 amount) public onlyTeacher(nextCourseId - 1) {
        payable(msg.sender).transfer(amount);
    }
}
