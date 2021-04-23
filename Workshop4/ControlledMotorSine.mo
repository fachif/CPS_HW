within CourseExamples.Workshop4;
model ControlledMotorSine
  extends ControlledMotor_PID_rename(redeclare Modelica.Blocks.Sources.Sine
      speed_sp(
      amplitude=25,
      freqHz=0.01,
      offset=175));
end ControlledMotorSine;
