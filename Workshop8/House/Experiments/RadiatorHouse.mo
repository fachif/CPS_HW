within CourseExamples.Workshop8.House.Experiments;
model RadiatorHouse
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature outTEMPERATURE
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.Constant const(k=273.15)
    annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
  Modelica.Blocks.Sources.Sine radiation(
    amplitude=500,
    freqHz=1/86400,
    phase=-1.5707963267949)
    annotation (Placement(transformation(extent={{94,-40},{74,-20}})));
  Modelica.Blocks.Sources.Sine theta(
    amplitude=55.5,
    freqHz=1/86400,
    phase=1.5707963267949,
    offset=97.5)
    annotation (Placement(transformation(extent={{96,12},{76,32}})));
  Rooms.RadiatorRoom radiatorRoom
    annotation (Placement(transformation(extent={{16,-18},{54,20}})));
  Modelica.Fluid.Sources.FixedBoundary source(
    redeclare package Medium = Modelica.Media.Water.WaterIF97_ph,
    p=250000,
    T=343.15,
    nPorts=1)
    annotation (Placement(transformation(extent={{-52,-52},{-32,-32}})));
  Modelica.Fluid.Sources.FixedBoundary sink(redeclare package Medium =
        Modelica.Media.Water.WaterIF97_ph, nPorts=1) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={24,-44})));
equation
  connect(const.y, outTEMPERATURE.T)
    annotation (Line(points={{-55,0},{-22,0}}, color={0,0,127}));
  connect(theta.y, radiatorRoom.theta) annotation (Line(points={{75,22},{70,22},
          {70,-10.7167},{53.6833,-10.7167}}, color={0,0,127}));
  connect(radiation.y, radiatorRoom.radiation1) annotation (Line(points={{73,
          -30},{64,-30},{64,-5.33333},{53.6833,-5.33333}}, color={0,0,127}));
  connect(radiatorRoom.wallPort, outTEMPERATURE.port) annotation (Line(points={
          {18.85,1},{10.425,1},{10.425,0},{0,0}}, color={191,0,0}));
  connect(radiatorRoom.winPORT, outTEMPERATURE.port) annotation (Line(points={{
          51.15,1.95},{58,1.95},{58,26},{10,26},{10,0},{0,0}}, color={191,0,0}));
  connect(radiatorRoom.port_a, source.ports[1]) annotation (Line(points={{
          19.1667,-15.7833},{-19.4167,-15.7833},{-19.4167,-42},{-32,-42}},
        color={0,127,255}));
  connect(sink.ports[1], radiatorRoom.port_b) annotation (Line(points={{34,-44},
          {54,-44},{54,-15.7833},{53.6833,-15.7833}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end RadiatorHouse;
