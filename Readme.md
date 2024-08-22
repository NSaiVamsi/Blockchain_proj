# Decentralized Student Attendance & Reward System

## Vision of the Project

The vision of this project is to create an all-in-one decentralized system for managing student attendance and rewarding students for their participation. By leveraging blockchain technology, this system ensures that attendance records are immutable, secure, and easily auditable, while also providing a decentralized incentive structure that motivates students to attend classes regularly.

## Features of the Project

- **All-In-One Solution:**
  - Manage student enrollment, attendance, and rewards within a single smart contract.
  
- **Decentralized Attendance Verification:**
  - Securely record student attendance using blockchain technology, ensuring data integrity and transparency.
  
- **Geolocation-Based Verification:**
  - Attendance is marked based on the student’s geolocation to ensure physical presence in the classroom.
  
- **Incentive System:**
  - Reward students with tokens/coins for attending classes.
  - Direct integration with digital wallets for easy token distribution.
  
- **Role-Based Access:**
  - **Teachers:** Create courses, enroll students, verify attendance, and distribute rewards.
  - **Proctors:** Mark attendance by scanning student IDs.
  - **Students:** Scan their IDs to mark attendance and receive rewards.

## Contract Information

### **Smart Contract:**
   - This singular smart contract handles all functionalities:
     - **Student Enrollment:** Registers students and manages their information.
     - **Course Creation:** Allows teachers to create courses and manage student enrollment.
     - **Attendance Marking:** Verifies attendance based on geolocation and student registration.
     - **Reward Distribution:** Distributes tokens to students who have attended classes based on the criteria.

### **Functions:**
   - **createCourse:** Teachers can create courses with a specified geolocation and reward amount.
   - **enrollStudent:** Teachers can enroll students into the course.
   - **markAttendance:** Proctors or teachers can mark attendance after verifying geolocation.
   - **distributeRewards:** Rewards are distributed to students who have attended classes.
   - **fundContract:** Teachers can fund the contract for rewards.
   - **withdrawFunds:** Teachers can withdraw remaining funds.

## Architecture of the Project

The smart contract is designed to be a comprehensive solution where all the functionalities are integrated into a single contract. This simplifies deployment and management while ensuring that all processes are securely handled on the blockchain.

### Workflow:
   1. **Course Creation:**
      - Teachers create courses and specify a geolocation and reward amount.
   
   2. **Student Enrollment:**
      - Students are enrolled in courses by the teacher, storing their data in the contract.
   
   3. **Attendance Marking:**
      - Attendance is marked by scanning the student’s ID and verifying their geolocation matches the course location.
   
   4. **Reward Distribution:**
      - The contract automatically distributes rewards to students who meet the attendance criteria.

## Future Scope of the Project

- **Scalability:**
  - Enhance the contract to handle larger numbers of students and courses efficiently.
  
- **Advanced Geolocation Verification:**
  - Implement more advanced geolocation technologies for even more accurate location verification.
  
- **Integration with Other Platforms:**
  - Expand the system to integrate with learning management systems (LMS) and other educational platforms.
  
- **Multi-Course Support:**
  - Extend the contract to allow for more complex scenarios, such as students attending multiple courses simultaneously.
  
- **Enhanced Reward Models:**
  - Explore additional incentive models, such as reputation systems or multi-tiered rewards based on attendance patterns.

## Author

- **Narsupalli Sai Vamsi**

## Contact Information

- **Twitter:** [@SaivamsiN7509](https://x.com/SaivamsiN7509?t=9eU6qcvnnOl4EjC7Y_lwUg&s=08)
