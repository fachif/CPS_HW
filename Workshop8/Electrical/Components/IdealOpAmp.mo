within CourseExamples.Workshop8.Electrical.Components;
model IdealOpAmp
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n
    annotation (Placement(transformation(extent={{-114,60},{-94,80}}),
        iconTransformation(extent={{-114,60},{-94,80}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p
    annotation (Placement(transformation(extent={{-114,-80},{-94,-60}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin out
    annotation (Placement(transformation(extent={{54,-10},{74,10}})));
equation
  pin_p.v = pin_n.v;
  pin_n.i = 0;
  pin_p.i = 0;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Line(
            points={{-94,70},{-94,-72},{54,0},{-94,70}}, color={28,108,200}),
          Text(
          extent={{-80,20},{2,-10}},
          lineColor={28,108,200},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end IdealOpAmp;
