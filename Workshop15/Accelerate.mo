within CourseExamples.Workshop15;
model Accelerate "Use of model accelerate."

  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Sources.Accelerate accelerate
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Mechanics.Translational.Components.Mass mass(L=1, m=1)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Sources.Constant constantAcc(k=1) annotation (Placement(
        transformation(extent={{-80,20},{-60,40}})));
equation
  connect(accelerate.flange, mass.flange_a) annotation (Line(
      points={{-20,30},{0,30}},
      color={0,127,0}));
  connect(constantAcc.y, accelerate.a_ref) annotation (Line(
      points={{-59,30},{-42,30}},
      color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
Demonstrate usage of component Sources.Accelerate by moving a massing
with a predefined acceleration.
</p>
</html>"),
       experiment(StopTime=1.0, Interval=0.001));
end Accelerate;
