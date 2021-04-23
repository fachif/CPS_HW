within CourseExamples.Workshop11.Interfaces;
partial model Chassis
  parameter Modelica.SIunits.Velocity v_start "Chassis initial speed.";


  Modelica.Blocks.Interfaces.RealOutput speed
    annotation (Placement(transformation(extent={{96,-10},{116,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a driveline_flange
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Chassis;
