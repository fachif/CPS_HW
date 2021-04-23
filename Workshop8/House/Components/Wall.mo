within CourseExamples.Workshop8.House.Components;
model Wall
  "Simple wall structure with thermal conductance and convection."

  parameter Modelica.SIunits.ThermalConductance G_wall;
  parameter Modelica.SIunits.ThermalConductance Gc_wall;
  parameter Modelica.SIunits.HeatCapacity C_wall;
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a outside
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b inside
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection WallsAirConv
    annotation (Placement(transformation(extent={{18,-10},{38,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=Gc_wall)
    annotation (Placement(transformation(extent={{-20,14},{0,34}})));
  LayeredWall WALL(
    G_wall1=2*G_wall,
    G_wall2=2*G_wall,
    C_wall=C_wall)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(realExpression.y, WallsAirConv.Gc)
    annotation (Line(points={{1,24},{28,24},{28,10}}, color={0,0,127}));
  connect(WallsAirConv.fluid, inside)
    annotation (Line(points={{38,0},{100,0}}, color={191,0,0}));
  connect(WALL.port_b, WallsAirConv.solid)
    annotation (Line(points={{-41.5,0},{18,0}}, color={191,0,0}));
  connect(WALL.port_a, outside)
    annotation (Line(points={{-58.5,0},{-100,0}}, color={191,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-74,52},{66,-68}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Rectangle(
          extent={{-58,70},{82,-54}},
          lineColor={28,108,200},
          lineThickness=0.5),
        Line(
          points={{-74,52},{-58,70},{82,70},{66,52},{66,-68},{82,-54},{-58,-54},
              {-74,-68}},
          color={28,108,200},
          thickness=0.5),
        Text(
          extent={{-36,20},{38,-20}},
          lineColor={28,108,200},
          lineThickness=0.5,
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Wall;
