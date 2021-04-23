within CourseExamples.Workshop7;
model SolarCollector "Solar collector with efficiency and losses"
  import SI = Modelica.SIunits;
  parameter SI.Angle A=500 "Area of collector"
    annotation (Dialog(group="Geometry"));
  parameter Modelica.SIunits.Angle theta_0 = 1.473 "Angle of incidence factor";
  parameter Real a0=0.75 "Efficiency when operating at ambient temperature"
    annotation (Dialog(group="Efficiency"));
  parameter Real a1=4.4 "Linear Loss Factor"
    annotation (Dialog(group="Temperature-dependent losses"));
  parameter Real a2=0.004 " Quadratic Loss Factor"
    annotation (Dialog(group="Temperature-dependent losses"));
  parameter Real b0 = 0.108;
  parameter SI.Temperature Tamb=SI.Conversions.from_degC(15)
    "Ambient Temperature" annotation (Dialog(group="Efficiency"));
  SI.TemperatureDifference dT;
  Real eff "Collector Efficiency";
  Real F "Angle of incidence factor";
  Modelica.Blocks.Interfaces.RealInput theta "Angle of Incidence"
    annotation (Placement(transformation(extent={{-140,-90},{-100,-50}}),
        iconTransformation(extent={{-140,-90},{-100,-50}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b therm_con "Heat Port"
    annotation (Placement(transformation(extent={{96,-10},{116,10}})));
  Modelica.Blocks.Interfaces.RealInput G "Global Radiation Incident"
    annotation (Placement(transformation(extent={{-140,50},{-100,90}}),
        iconTransformation(extent={{-140,50},{-100,90}})));
equation
  F = if theta <= theta_0 then 1-b0*(1/cos(theta)-1) else 0;
  dT = therm_con.T - Tamb;
  eff = F*((a0-a1*dT/max(G,0.0001))-a2*(dT^2/max(G,0.0001)));
  therm_con.Q_flow = -eff*A*G "Heat Flow Generation";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                                                 Rectangle(
            extent={{-100,100},{100,-100}}, lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{40,80},{64,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-48,82},{40,42},{-48,82}},
          color={255,255,0},
          thickness=1),
        Line(
          points={{40,42},{30,52},{26,44},{40,42}},
          color={255,255,0},
          thickness=1),
        Line(
          points={{32,48},{28,48},{30,48}},
          color={255,255,0},
          thickness=1),
        Polygon(
          points={{30,52},{26,44},{40,42},{30,52}},
          lineColor={255,255,0},
          lineThickness=1,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-48,40},{40,0},{-48,40}},
          color={255,255,0},
          thickness=1),
        Polygon(
          points={{30,10},{26,2},{40,0},{30,10}},
          lineColor={255,255,0},
          lineThickness=1,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-48,-6},{40,-46},{-48,-6}},
          color={255,255,0},
          thickness=1),
        Polygon(
          points={{30,-36},{26,-44},{40,-46},{30,-36}},
          lineColor={255,255,0},
          lineThickness=1,
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-100,70},{-32,70},{-50,74},{-32,70},{-48,66}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{-100,-58},{-44,-34},{-62,-34},{-44,-34},{-56,-46}},
          color={0,0,0},
          thickness=1),
        Line(
          points={{40,-46},{-48,-46}},
          color={0,0,0},
          thickness=1)}),                                        Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Model of a solar collector with efficiency and losses.</p>
<p>The model takes the incidence and the incidence angles as inputs.</p>
<p>Efficiency is modelled depending on incident angle.</p>
<p>The losses are dependent on the ambient temperature difference with linear difference and a quadratic term.</p>
<p><img src=\"modelica://CourseExamples/../../scheme_swh.gif\"/></p>
</html>"));
end SolarCollector;
