within CourseExamples.Workshop11.Configurations;
model AccelerationTest
  extends Templates.StandardCar(
    redeclare SubSystems.BasicEngine engine,
    redeclare SubSystems.FixedTransmission transmission,
    redeclare SubSystems.RigidShaft shaft,
    redeclare SubSystems.IdealChassis chassis(v_start=25, v_starts=25));
  Modelica.Blocks.Sources.Constant const(k=1)
    annotation (Placement(transformation(extent={{-88,-50},{-68,-30}})));
equation
  connect(const.y, engine.throttle) annotation (Line(points={{-67,-40},{-60,-40},
          {-60,-24},{-90,-24},{-90,0},{-79,0}}, color={0,0,127}));
end AccelerationTest;
