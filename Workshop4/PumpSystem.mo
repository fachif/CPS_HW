within CourseExamples.Workshop4;
model PumpSystem

  Modelica.Blocks.Sources.Ramp speed_sp(
    height=-50,
    duration=10,
    offset=60,
    startTime=100)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Continuous.LimPID PID(
    k=20,
    Ti=10,
    Td=0.01,
    yMax=300,
    yMin=0,
    initType=Modelica.Blocks.Types.InitPID.NoInit)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor
    annotation (Placement(transformation(extent={{52,6},{72,26}})));
  CourseExamples.Components.Electrical.ElectricalMotor electricalMotor(ratio=3, J=10)
           annotation (Placement(transformation(extent={{-2,10},{18,30}})));
  Modelica.Fluid.Sources.FixedBoundary source(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=100000,
    nPorts=1)
    annotation (Placement(transformation(extent={{-112,-128},{-92,-108}})));

  Modelica.Fluid.Sources.FixedBoundary sink(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    p=100000,
    nPorts=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={100,-120})));

  Modelica.Fluid.Pipes.StaticPipe pipe(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    length=10,
    diameter=0.05,
    height_ab=10)
    annotation (Placement(transformation(extent={{-42,-128},{-22,-108}})));

  Modelica.Fluid.Vessels.OpenTank tank(
    height=3,
    crossArea=5,
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    use_portsData=true,
    portsData={Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1),
        Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1)},
    nPorts=2)
    annotation (Placement(transformation(extent={{-20,-100},{20,-60}})));

  Modelica.Fluid.Valves.ValveLinear valveLinear(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    dp_nominal=5000,
    m_flow_nominal=100)
    annotation (Placement(transformation(extent={{50,-130},{70,-110}})));

  Modelica.Blocks.Sources.Step step(
    height=0.999,
    offset=0.001,
    startTime=20)
    annotation (Placement(transformation(extent={{100,-80},{80,-60}})));
  Modelica.Fluid.Machines.Pump pump1(
    redeclare package Medium = Modelica.Media.Water.ConstantPropertyLiquidWater,
    redeclare function flowCharacteristic =
        Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow (
          V_flow_nominal={0,0.1}, head_nominal={10,0}),
    N_nominal=130)
    annotation (Placement(transformation(extent={{-76,-128},{-56,-108}})));

  inner Modelica.Fluid.System system
    annotation (Placement(transformation(extent={{-110,70},{-90,90}})));
equation
  connect(speed_sp.y, PID.u_s)
    annotation (Line(points={{-59,30},{-42,30}}, color={0,0,127}));
  connect(PID.y, electricalMotor.v1) annotation (Line(points={{-19,30},{-4,30},
          {-4,29},{-3,29}}, color={0,0,127}));
  connect(speedSensor.flange, electricalMotor.flange_b1)
    annotation (Line(points={{52,16},{19.4,16},{19.4,14.4}},   color={0,0,0}));
  connect(speedSensor.w, PID.u_m) annotation (Line(points={{73,16},{78,16},{78,
          -40},{-30,-40},{-30,18}},    color={0,0,127}));
  connect(step.y, valveLinear.opening)
    annotation (Line(points={{79,-70},{60,-70},{60,-112}}, color={0,0,127}));
  connect(valveLinear.port_b, sink.ports[1])
    annotation (Line(points={{70,-120},{90,-120}}, color={0,127,255}));
  connect(valveLinear.port_a, tank.ports[1]) annotation (Line(points={{50,-120},
          {-4,-120},{-4,-100}}, color={0,127,255}));
  connect(pipe.port_b, tank.ports[2]) annotation (Line(points={{-22,-118},{4,
          -118},{4,-100}}, color={0,127,255}));
  connect(pump1.port_b, pipe.port_a)
    annotation (Line(points={{-56,-118},{-42,-118}}, color={0,127,255}));
  connect(pump1.port_a, source.ports[1])
    annotation (Line(points={{-76,-118},{-92,-118}}, color={0,127,255}));
  connect(pump1.shaft, electricalMotor.flange_b1) annotation (Line(points={{-66,
          -108},{-66,-26},{34,-26},{34,16},{19.4,16},{19.4,14.4}}, color={0,0,0}));
  annotation (Diagram(coordinateSystem(extent={{-120,-140},{120,100}})), Icon(
        coordinateSystem(extent={{-120,-140},{120,100}})));
end PumpSystem;
