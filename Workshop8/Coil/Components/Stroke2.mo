within CourseExamples.Workshop8.Coil.Components;
model Stroke2
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Mechanics.Translational.Components.ElastoGap stopA(
    c=c,
    d=d,
    s_rel0=s_a)
    annotation (Placement(transformation(extent={{-78,30},{-58,50}})));
  Modelica.Mechanics.Translational.Components.ElastoGap stopB(
    c=c,
    d=d,
    s_rel0=-s_b)
    annotation (Placement(transformation(extent={{56,30},{76,50}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a mount
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
    parameter Modelica.SIunits.TranslationalSpringConstant c=1e5
    "Spring constant";
  parameter Modelica.SIunits.TranslationalDampingConstant d=10
    "Damping constant";
  parameter Modelica.SIunits.Position s_a=-0.01 "Unstretched spring length";
  parameter Modelica.SIunits.Position s_b=0.01 "Unstretched spring length";
equation
  connect(stopA.flange_b, stopB.flange_a)
    annotation (Line(points={{-58,40},{56,40}}, color={0,127,0}));
  connect(flange, stopB.flange_a)
    annotation (Line(points={{0,60},{0,40},{56,40}}, color={0,127,0}));
  connect(stopA.flange_a, stopB.flange_b) annotation (Line(points={{-78,40},{
          -78,0},{76,0},{76,40}}, color={0,127,0}));
  connect(mount, stopB.flange_b)
    annotation (Line(points={{0,-40},{0,0},{76,0},{76,40}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(extent={{-80,54},{80,-34}}, lineColor={28,108,200}), Text(
          extent={{-50,28},{50,-4}},
          lineColor={28,108,200},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Stroke2;
