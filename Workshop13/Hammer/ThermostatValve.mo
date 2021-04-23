within CourseExamples.Workshop13.Hammer;
model ThermostatValve
  extends Modelica.Fluid.Interfaces.PartialTwoPort;
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Fluid.Valves.ValveLinear valveLinear(redeclare package Medium =
        Modelica.Media.Water.ConstantPropertyLiquidWater)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder(
    k=1,
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  ThermostatLogicSign thermostatLogicSign(
    T_up_start=T_up_start,
    T_up_end=T_up_end,
    T_down_start=T_down_start,
    T_down_end=T_down_end,
    s_max=s_max,
    s_min=s_min) annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(
    k=1,
    T=1,
    initType=Modelica.Blocks.Types.Init.SteadyState)
    annotation (Placement(transformation(extent={{40,20},{60,40}})));
  parameter Modelica.SIunits.Temperature T_up_start=300;
  parameter Modelica.SIunits.Temperature T_up_end=330;
  parameter Modelica.SIunits.Temperature T_down_start=310;
  parameter Modelica.SIunits.Temperature T_down_end=290;
  parameter Real s_max=1.0;
  parameter Real s_min=0.1;
equation
  connect(valveLinear.port_a, port_a)
    annotation (Line(points={{60,0},{-100,0}}, color={0,127,255}));
  connect(valveLinear.port_b, port_b)
    annotation (Line(points={{80,0},{100,0}}, color={0,127,255}));
  connect(temperature.port, port_a)
    annotation (Line(points={{-70,20},{-70,0},{-100,0}}, color={0,127,255}));
  connect(firstOrder.u, temperature.T)
    annotation (Line(points={{-42,30},{-63,30}}, color={0,0,127}));
  connect(firstOrder.y, thermostatLogicSign.u)
    annotation (Line(points={{-19,30},{-2,30}}, color={0,0,127}));
  connect(firstOrder1.u, thermostatLogicSign.y)
    annotation (Line(points={{38,30},{21,30}}, color={0,0,127}));
  connect(firstOrder1.y, valveLinear.opening)
    annotation (Line(points={{61,30},{70,30},{70,8}}, color={0,0,127}));
  annotation (Icon(graphics={Rectangle(extent={{-96,42},{96,-36}}, lineColor={
              28,108,200}), Text(
          extent={{-44,14},{36,-6}},
          lineColor={28,108,200},
          textString="%name")}));
end ThermostatValve;
