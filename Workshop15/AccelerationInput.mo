within CourseExamples.Workshop15;
model AccelerationInput "Use of model accelerate."

  extends Modelica.Icons.Example;
  Modelica.Mechanics.Translational.Sources.Accelerate accelerate
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Mechanics.Translational.Components.Mass mass(L=1, m=1)
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Interfaces.RealInput a_ref_input
    "Absolute acceleration of flange as input signal"
    annotation (Placement(transformation(extent={{-132,10},{-92,50}})));
equation
  connect(accelerate.flange, mass.flange_a) annotation (Line(
      points={{-20,30},{0,30}},
      color={0,127,0}));
  connect(accelerate.a_ref, a_ref_input)
    annotation (Line(points={{-42,30},{-112,30}}, color={0,0,127}));
  annotation (Documentation(info="<html>
<p>
Demonstrate usage of component Sources.Accelerate by moving a massing
with a predefined acceleration.
</p>
</html>"),
       experiment(StopTime=1.0, Interval=0.001));
end AccelerationInput;
