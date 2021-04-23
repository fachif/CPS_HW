within CourseExamples.Workshop14;
model ControlledMotor

  replaceable
  Modelica.Blocks.Sources.Ramp speed_sp(
    height=-50,
    duration=10,
    offset=200,
    startTime=200) constrainedby Modelica.Blocks.Interfaces.SO
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Continuous.LimPID PID(
    k=20,
    Ti=10,
    Td=0.01,
    yMax=300,
    yMin=0,
    initType=Modelica.Blocks.Types.InitPID.NoInit)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Mechanics.Rotational.Sources.LinearSpeedDependentTorque
    linearSpeedDependentTorque(tau_nominal=-10, w_nominal=200)
    annotation (Placement(transformation(extent={{62,10},{42,30}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{44,-26},{64,-6}})));
  CourseExamples.Components.Electrical.ElectricalMotor electricalMotor(ratio=3,
    J=1,
    inertia(J=10))
           annotation (Placement(transformation(extent={{-2,10},{18,30}})));
equation
  connect(speed_sp.y, PID.u_s)
    annotation (Line(points={{-59,30},{-42,30}}, color={0,0,127}));
  connect(PID.y, electricalMotor.v1) annotation (Line(points={{-19,30},{-4,30},
          {-4,29},{-3,29}}, color={0,0,127}));
  connect(electricalMotor.flange_b1, linearSpeedDependentTorque.flange)
    annotation (Line(points={{19.4,14.4},{28,14.4},{28,20},{42,20}}, color={0,0,
          0}));
  connect(speedSensor.flange, electricalMotor.flange_b1)
    annotation (Line(points={{44,-16},{19.4,-16},{19.4,14.4}}, color={0,0,0}));
  connect(speedSensor.w, PID.u_m) annotation (Line(points={{65,-16},{72,-16},{
          72,-40},{-30,-40},{-30,18}}, color={0,0,127}));
  annotation (__Dymola_Commands(file="*.mos" "Run sweep of a variable"));
end ControlledMotor;
