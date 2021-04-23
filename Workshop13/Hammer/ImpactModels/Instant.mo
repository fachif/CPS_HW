within CourseExamples.Workshop13.Hammer.ImpactModels;
model Instant
  Modelica.Blocks.Sources.Sine sine(freqHz=10)
    annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=1, L=0.1)
    annotation (Placement(transformation(extent={{8,-10},{28,10}})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1(s0=0.29) annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={86,0})));
  Modelica.Mechanics.Translational.Sources.Position Maxwells_Silver_Hammer(
      exact=false)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Mechanics.Translational.Components.Spring spring1(c=100, s_rel0=0.1)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  NewtonImpact newtonImpact
    annotation (Placement(transformation(extent={{-28,-10},{-8,10}})));
equation
  connect(sine.y, Maxwells_Silver_Hammer.s_ref)
    annotation (Line(points={{-71,0},{-62,0}}, color={0,0,127}));
  connect(mass.flange_b, spring1.flange_a)
    annotation (Line(points={{28,0},{40,0}}, color={0,127,0}));
  connect(spring1.flange_b, fixed1.flange)
    annotation (Line(points={{60,0},{86,0}}, color={0,127,0}));
  connect(newtonImpact.flange_b, mass.flange_a)
    annotation (Line(points={{-8,0},{8,0}}, color={0,127,0}));
  connect(newtonImpact.flange_a, Maxwells_Silver_Hammer.flange)
    annotation (Line(points={{-28,0},{-40,0}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Instant;
