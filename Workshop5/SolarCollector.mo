within CourseExamples.Workshop5;
model SolarCollector
  import SI = Modelica.SIunits;
  parameter SI.Angle A = 500;
  parameter Modelica.SIunits.Angle theta_0 = 1.473;
  parameter Real a0 = 0.75;
  parameter Real a1 = 4.4;
  parameter Real a2 = 0.004;
  parameter Real b0 = 0.108;
  parameter SI.Temperature Tamb = SI.Conversions.from_degC(15);
  SI.TemperatureDifference dT;
  Real eff;
  Real F;
  Modelica.Blocks.Interfaces.RealInput theta
    annotation (Placement(transformation(extent={{-140,-90},{-100,-50}}),
        iconTransformation(extent={{-140,-90},{-100,-50}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b therm_con
    annotation (Placement(transformation(extent={{96,-10},{116,10}})));
  Modelica.Blocks.Interfaces.RealInput G
    annotation (Placement(transformation(extent={{-140,50},{-100,90}}),
        iconTransformation(extent={{-140,50},{-100,90}})));
equation
  F = if theta <= theta_0 then 1-b0*(1/cos(theta)-1) else 0;
  dT = therm_con.T - Tamb;
  eff = F*((a0-a1*dT/max(G,0.0001))-a2*(dT^2/max(G,0.0001)));
  therm_con.Q_flow = -eff*A*G;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Bitmap(
          extent={{-96,-96},{98,100}},
          imageSource=
              "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"
               +
              "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",
          fileName="modelica://CourseExamples/../image002.jpg"), Rectangle(
            extent={{-100,100},{100,-100}}, lineColor={28,108,200})}),
                                                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SolarCollector;
