# Traffic Lights Controller


## Objective
The goal of this project is to create Verilog code that embeds a finite state machine that regulates traffic lights at an intersection.

## Introduction
The following intersection has two streets labeled street A and street B. For both streets A and B, there is a traffic light directing traffic. The signal `{RA, RB}` is short for red which means stop, the `{GA, GB}` is green which means go, and `{OA, OB}` is orange which means slow down. In addition, street A is primary street and has a higher precedence over street B.

## Instructions
- There is a sensor placed on street B which detects any cars waiting on street B. This sensor outputs a 1 with value “High” if there is a car on street B and a “Low” if there is no car on street B.
- Once street A gets a green signal, it stays on for at least 60 seconds.
- If there is no car on street B, the signal A stays Green always.
- If the sensor detects a car on street B, the signal A turns orange for a duration of 10 seconds and then signal B turns Green with signal A turning Red.
- Once signal B turns red, signal A turns to green again.

## State Diagram
- STAP: Street A Pass
- STBP: Street B Pass
- TA: Traffic light A
- TB: Traffic light B



Finite State Machine Circuit:
1. GA: Green for traffic light A
2. GB: Green for traffic light B
3. RA: Red for traffic light A
4. RB: Red for traffic light B
5. OA: Orange for traffic light A
6. OB: Orange for traffic light B

## Table
Output STAP STBP TA TB
GA 1 0 0 0 GB 0 1 0 0 RA 0 1 1 0 RB 1 0 0 1 OA 0 0 0 1 OB 0 0 1 0

## Simulation
### States: TA & STAP
We begin in state TA, which is our reset state. That instance, traffic light B will be orange for 10 seconds before turning red, while traffic light A will become red. After 10 seconds, we switch to STAP mode, where traffic light B is red and traffic light A is green for 60 seconds.

### States: TB & STBP
After 60 seconds, we transition to state TB due to the sensor detecting a car at street B. We stay at TB for 10 seconds before switching to state STBP. This indicates that traffic light at street A will be Orange for 10 seconds before turning Red. Once, the 10 seconds are up we go to state STBP. At STBP the traffic light at street B will turn green and red for traffic light at A for a duration of 30 seconds.

### State: STEP & TA
After 30 seconds we go from STEP back again to TA, as shown in the waveform above which demonstrates a full cycle.

## Conclusion
In conclusion, in this lab we were able to construct a simple finite state machine that can safely direct traffic at an intersection using traffic lights. This demonstrates the significance of finite state machines in real-world applications. I know that as my engineering education progresses, finite state machines will be fundamental to designing more complex innovations in the future.

