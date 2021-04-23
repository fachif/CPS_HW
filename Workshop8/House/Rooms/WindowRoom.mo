within CourseExamples.Workshop8.House.Rooms;
model WindowRoom
  extends Interfaces.PartialRoom;
   parameter Modelica.SIunits.HeatCapacity C_wall=1e5 "heat capacity in wall";
   parameter Modelica.SIunits.Area A_window = 2 " Window Area";
   parameter Modelica.SIunits.ThermalConductance Gc_window = 3.5 "Convection from window.";
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor airHeatCapacity(C = C_room)
    annotation (Placement(transformation(extent={{-10,12},{10,32}})));
  Components.Wall wall(
    G_wall=G_wall,
    Gc_wall=Gc_wall,
    C_wall=C_wall)
    annotation (Placement(transformation(extent={{-62,-18},{-18,20}})));
  Components.Window window(A_window=A_window, Gc_window=Gc_window)
    annotation (Placement(transformation(extent={{10,-18},{54,18}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a winPORT
    annotation (Placement(transformation(extent={{92,-4},{112,16}})));
  Modelica.Blocks.Interfaces.RealInput radiation1 annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={118,-40})));
  Modelica.Blocks.Interfaces.RealInput theta annotation (Placement(
        transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={118,-74})));
equation
  connect(wall.outside, wallPort) annotation (Line(points={{-62,1},{-82,1},{-82,
          0},{-102,0}}, color={191,0,0}));
  connect(wall.inside, airHeatCapacity.port)
    annotation (Line(points={{-18,1},{0,1},{0,12}},   color={191,0,0}));
  connect(window.inside, airHeatCapacity.port)
    annotation (Line(points={{9.56,0},{0,0},{0,12}}, color={191,0,0}));
  connect(window.outside, winPORT)
    annotation (Line(points={{54,3.6},{102,3.6},{102,6}}, color={191,0,0}));
  connect(window.radiation, radiation1) annotation (Line(points={{56.2,-3.6},{
          78,-3.6},{78,-40},{118,-40}}, color={0,0,127}));
  connect(window.theta, theta) annotation (Line(points={{56.2,-10.8},{68,-10.8},
          {68,-74},{118,-74}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-140,-100},{140,100}})), Icon(
        coordinateSystem(extent={{-140,-100},{140,100}}), graphics={Text(
          extent={{-54,-60},{56,-90}},
          lineColor={238,46,47},
          lineThickness=0.5,
          textString="%name"),
        Rectangle(
          extent={{28,10},{64,-18}},
          lineColor={0,0,0},
          lineThickness=1,
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Line(
          points={{46,10},{46,-18}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{28,-4},{64,-4}},
          color={0,0,0},
          thickness=0.5)}));
end WindowRoom;
