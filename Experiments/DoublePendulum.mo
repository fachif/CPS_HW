within CourseExamples.Experiments;
model DoublePendulum
  "Simple double pendulum with two revolute joints and two bodies"

  extends Modelica.Icons.Example;
  inner Modelica.Mechanics.MultiBody.World world annotation (Placement(
        transformation(extent={{-88,0},{-68,20}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox boxBody1(r={0.5,0,0}, width=0.06)
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(phi(fixed=true), w(
        fixed=true))                                     annotation (Placement(transformation(extent={{32,0},{
            52,20}})));
  Modelica.Mechanics.MultiBody.Parts.BodyBox boxBody2(r={0.5,0,0}, width=0.06)
    annotation (Placement(transformation(extent={{74,0},{94,20}})));
  Components.Mechanical.MyRevolute myRevolute annotation (Placement(
        transformation(rotation=0, extent={{-48,20},{-28,40}})));
equation

  connect(myRevolute.frame_b,boxBody1.frame_a)
    annotation (Line(
      points={{-28,24},{-20,24},{-20,10},{-10,10}},
      color={95,95,95},
      thickness=0.5));
  connect(revolute2.frame_b, boxBody2.frame_a)
    annotation (Line(
      points={{52,10},{74,10}},
      color={95,95,95},
      thickness=0.5));
  connect(boxBody1.frame_b, revolute2.frame_a)
    annotation (Line(
      points={{10,10},{32,10}},
      color={95,95,95},
      thickness=0.5));
  connect(world.frame_b,myRevolute.frame_a)
    annotation (Line(
      points={{-68,10},{-58,10},{-58,24},{-48,24}},
      color={95,95,95},
      thickness=0.5));
  annotation (__Dymola_selections={
  Selection(name="MySelection",
  match={MatchVariable(name="*.(phi|tau)", newName = "%path%")})},
    experiment(StopTime=3),
    Documentation(info="<html>
<p>
This example demonstrates that by using joint and body
elements animation is automatically available. Also the revolute
joints are animated. Note, that animation of every component
can be switched of by setting the first parameter <b>animation</b>
to <b>false</b> or by setting <b>enableAnimation</b> in the <b>world</b>
object to <b>false</b> to switch off animation of all components.
</p>

<table border=0 cellspacing=0 cellpadding=0><tr><td valign=\"top\">
<IMG src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/DoublePendulum.png\"
ALT=\"model Examples.Elementary.DoublePendulum\">
</td></tr></table>

</html>"));
end DoublePendulum;
