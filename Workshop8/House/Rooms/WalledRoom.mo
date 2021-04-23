within CourseExamples.Workshop8.House.Rooms;
model WalledRoom
  extends Interfaces.PartialRoom;
   parameter Modelica.SIunits.HeatCapacity C_wall=1e5 "heat capacity in wall";
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor airHeatCapacity(C = C_room)
    annotation (Placement(transformation(extent={{16,14},{36,34}})));
  Components.Wall wall(
    G_wall=G_wall,
    Gc_wall=Gc_wall,
    C_wall=C_wall)
    annotation (Placement(transformation(extent={{-64,-18},{-20,20}})));
equation
  connect(wall.outside, wallPort) annotation (Line(points={{-64,1},{-82,1},{-82,
          0},{-102,0}}, color={191,0,0}));
  connect(wall.inside, airHeatCapacity.port)
    annotation (Line(points={{-20,1},{26,1},{26,14}}, color={191,0,0}));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{100,100}})), Icon(
        coordinateSystem(extent={{-140,-100},{100,100}}), graphics={Text(
          extent={{-54,-60},{56,-90}},
          lineColor={238,46,47},
          lineThickness=0.5,
          textString="%name")}));
end WalledRoom;
