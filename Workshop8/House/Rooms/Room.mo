within CourseExamples.Workshop8.House.Rooms;
model Room
  extends Interfaces.PartialRoom;
  Components.SimpleWall simpleWall(G_wall = G_wall, Gc_wall = Gc_wall)
    annotation (Placement(transformation(extent={{-66,-10},{-22,26}})));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor airHeatCapacity(C = C_room)
    annotation (Placement(transformation(extent={{16,14},{36,34}})));
equation
  connect(simpleWall.outside, wallPort) annotation (Line(points={{-66,8},{-84,8},
          {-84,0},{-102,0}}, color={191,0,0}));
  connect(airHeatCapacity.port, simpleWall.inside)
    annotation (Line(points={{26,14},{26,8},{-22,8}},   color={191,0,0}));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-140,-100},{100,100}}), graphics={Text(
          extent={{-54,-60},{56,-90}},
          lineColor={238,46,47},
          lineThickness=0.5,
          textString="%name")}));
end Room;
