within CourseExamples.Workshop8.House.Components;
model Pane
  import SI = Modelica.SIunits;
  parameter Real a0 = 0.75;
  parameter Real a1 = 4.4;
  parameter Real a2 = 0.004;
  parameter Modelica.SIunits.Area A;
  Real eff "Collector efficiency";
  Real F;
  Real G_aux "Variable used to avoid G=0";
  Modelica.Blocks.Interfaces.RealInput theta
    annotation (Placement(transformation(extent={{-140,-90},{-100,-50}}),
        iconTransformation(extent={{-140,-90},{-100,-50}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b
    annotation (Placement(transformation(extent={{96,-10},{116,10}})));
  Modelica.Blocks.Interfaces.RealInput G
    annotation (Placement(transformation(extent={{-140,50},{-100,90}}),
        iconTransformation(extent={{-140,50},{-100,90}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a
    annotation (Placement(transformation(extent={{-116,-10},{-96,10}})));
equation
  port_a.Q_flow = -port_b.Q_flow;
  port_b.Q_flow = -eff*A*G;
  G_aux = if abs(G) < Modelica.Constants.eps then Modelica.Constants.eps else G;
  eff = F*(a0-a1*(port_b.T - port_a.T)/G_aux - a2*(port_b.T - port_a.T)^2/G_aux);
  F = if theta > 84.4 then 0.0 else 1-0.108*(1/cos(theta/360*2*Modelica.Constants.pi)-1);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                                                 Rectangle(
            extent={{-100,100},{100,-100}}, lineColor={28,108,200}), Text(
          extent={{-72,22},{68,-28}},
          lineColor={0,0,0},
          lineThickness=0.5,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid,
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Pane;
