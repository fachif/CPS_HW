within CourseExamples.Workshop11.Templates;
partial model StandardCar
  replaceable Interfaces.Engine engine
    annotation (Placement(transformation(extent={{-78,-10},{-58,10}})));
  replaceable Interfaces.Transmission transmission
    annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));
  replaceable Interfaces.Shaft shaft
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  replaceable Interfaces.Chassis chassis
    annotation (Placement(transformation(extent={{56,-10},{76,10}})));
equation
  connect(engine.transmission_flange, transmission.engine_flange)
    annotation (Line(points={{-58,0},{-32,0}}, color={0,0,0}));
  connect(transmission.driveline_flange, shaft.flange_a)
    annotation (Line(points={{-12,0},{10,0}}, color={0,0,0}));
  connect(shaft.flange_b, chassis.driveline_flange)
    annotation (Line(points={{30,0},{56,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end StandardCar;
