within CourseExamples.Workshop10;
model Pendulum "Simple pendulum with one revolute joint and one body"
  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.
        UniformGravity) annotation (Placement(transformation(extent={{-60,0},{
            -40,20}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute rev(
    n={0,0,1},                                               useAxisFlange=true,
    phi(fixed=true, start=1.5690509975429),
    w(fixed=true))             annotation (Placement(transformation(extent={{
            -20,0},{0,20}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(m=1.0, r_CM={0.5,0,0})
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
equation
  connect(world.frame_b, rev.frame_a)
    annotation (Line(
      points={{-40,10},{-20,10}},
      color={95,95,95},
      thickness=0.5));
  connect(body.frame_a, rev.frame_b) annotation (Line(
      points={{20,10},{0,10}},
      color={95,95,95},
      thickness=0.5));
  annotation (
    experiment(StopTime=5),
    Documentation(info="<html>
<p>
This simple model demonstrates that by just dragging components
default animation is defined that shows the structure of the
assembled system.

<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/Pendulum.png\"
ALT=\"model Examples.Elementary.Pendulum\">
</html>"));
end Pendulum;
