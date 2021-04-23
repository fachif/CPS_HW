within CourseExamples.Workshop6;
model DegreesofFreedom3
  Modelica.Mechanics.Rotational.Components.Inertia inertia
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Modelica.Mechanics.Rotational.Components.IdealPlanetary idealPlanetary
    annotation (Placement(transformation(extent={{4,-14},{24,6}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2
    annotation (Placement(transformation(extent={{46,-14},{66,6}})));
equation
  connect(idealPlanetary.ring, inertia2.flange_a)
    annotation (Line(points={{24,-4},{46,-4}}, color={0,0,0}));
  connect(inertia.flange_b, idealPlanetary.carrier)
    annotation (Line(points={{-20,20},{4,20},{4,0}}, color={0,0,0}));
  connect(inertia1.flange_b, idealPlanetary.sun)
    annotation (Line(points={{-20,-20},{4,-20},{4,-4}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DegreesofFreedom3;
