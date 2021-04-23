within CourseExamples.Workshop4;
model PumpSystem3

  Modelica.Blocks.Sources.Constant
                               speed_sp(k=1)
    annotation (Placement(transformation(extent={{-82,20},{-62,40}})));
  Modelica.Blocks.Continuous.LimPID PID(
    k=120,
    Ti=130,
    Td=20,
    yMax=500,
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
  Modelica.Blocks.Sources.RealExpression realExpression(y=tank.level)
    annotation (Placement(transformation(extent={{-70,-20},{-50,0}})));
  UserInteraction.Outputs.DynamicDiagram dynamicDiagram
    annotation (Placement(transformation(extent={{40,140},{100,200}})));
  Modelica.Blocks.Sources.RealExpression flowLevel(y=pump1.m_flow)
    annotation (Placement(transformation(extent={{-28,134},{-8,154}})));
  Modelica.Blocks.Sources.RealExpression tankLevel(y=tank.level)
    annotation (Placement(transformation(extent={{-28,114},{-8,134}})));
  UserInteraction.Outputs.DynamicDiagram dynamicDiagram1
    annotation (Placement(transformation(extent={{40,60},{100,120}})));
equation
  connect(speed_sp.y, PID.u_s)
    annotation (Line(points={{-61,30},{-42,30}}, color={0,0,127}));
  connect(PID.y, electricalMotor.v1) annotation (Line(points={{-19,30},{-4,30},
          {-4,29},{-3,29}}, color={0,0,127}));
  connect(speedSensor.flange, electricalMotor.flange_b1)
    annotation (Line(points={{52,16},{19.4,16},{19.4,14.4}},   color={0,0,0}));
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
  connect(realExpression.y, PID.u_m)
    annotation (Line(points={{-49,-10},{-30,-10},{-30,18}}, color={0,0,127}));
  connect(dynamicDiagram1.Value, tankLevel.y) annotation (Line(points={{40,90},
          {16,90},{16,124},{-7,124}}, color={0,0,127}));
  connect(flowLevel.y, dynamicDiagram.Value) annotation (Line(points={{-7,144},
          {16,144},{16,170},{40,170}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-120,-140},{120,220}})), Icon(
        coordinateSystem(extent={{-120,-140},{120,220}})));
end PumpSystem3;
