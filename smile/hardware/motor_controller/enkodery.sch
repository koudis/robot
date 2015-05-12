<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="53" name="tGND_GNDA" color="7" fill="1" visible="no" active="no"/>
<layer number="54" name="bGND_GNDA" color="7" fill="1" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="100" name="PaJa" color="12" fill="7" visible="yes" active="yes"/>
<layer number="101" name="Doplnky" color="5" fill="1" visible="yes" active="yes"/>
<layer number="102" name="Kola" color="11" fill="7" visible="yes" active="yes"/>
<layer number="103" name="Popisy" color="2" fill="8" visible="yes" active="yes"/>
<layer number="104" name="Zapojeni" color="6" fill="7" visible="yes" active="yes"/>
<layer number="110" name="wago-seda" color="7" fill="8" visible="yes" active="yes"/>
<layer number="111" name="wago-cervena" color="12" fill="8" visible="yes" active="yes"/>
<layer number="112" name="wago-zelena" color="2" fill="8" visible="yes" active="yes"/>
<layer number="113" name="wago-modra" color="1" fill="8" visible="yes" active="yes"/>
<layer number="151" name="HeatSink" color="7" fill="1" visible="no" active="no"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="no"/>
<layer number="250" name="Descript" color="3" fill="1" visible="no" active="no"/>
<layer number="251" name="SMDround" color="12" fill="11" visible="no" active="no"/>
<layer number="254" name="OrgLBR" color="13" fill="1" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="atmega8">
<description>&lt;b&gt;Atmel ATmega8, ATmega48, ATmega88, ATmega168: 8-bit AVR microcontrollers&lt;/b&gt;
&lt;p&gt;&lt;ul&gt;
&lt;li&gt;ATmega8, ATmega8L:&lt;br&gt;
28-pin PDIP, 32-lead TQFP and 32-pad QFN/MLF
&lt;li&gt;ATmega48, ATmega48V, ATmega88, ATmega88V, ATmega168, ATmega168V:&lt;br&gt;
 28-pin PDIP, 32-lead TQFP and 32-pad QFN/MLF (no 28-pad QFN/MLF!)
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;b&gt;Doublecheck before using!&lt;/b&gt;&lt;/p&gt;</description>
<packages>
<package name="MLF32">
<description>&lt;b&gt;32M1-A&lt;/b&gt; Micro Lead Frame package (MLF)</description>
<wire x1="-2.35" y1="2.05" x2="-2.05" y2="2.35" width="0.254" layer="21"/>
<wire x1="-2.05" y1="2.35" x2="2.05" y2="2.35" width="0.254" layer="51"/>
<wire x1="2.05" y1="2.35" x2="2.35" y2="2.05" width="0.254" layer="21"/>
<wire x1="2.35" y1="2.05" x2="2.35" y2="-2.05" width="0.254" layer="51"/>
<wire x1="2.35" y1="-2.05" x2="2.05" y2="-2.35" width="0.254" layer="21"/>
<wire x1="2.05" y1="-2.35" x2="-2.05" y2="-2.35" width="0.254" layer="51"/>
<wire x1="-2.05" y1="-2.35" x2="-2.35" y2="-2.05" width="0.254" layer="21"/>
<wire x1="-2.35" y1="-2.05" x2="-2.35" y2="2.05" width="0.254" layer="51"/>
<circle x="-1.55" y="1.55" radius="0.15" width="0.254" layer="21"/>
<smd name="1" x="-2.35" y="1.75" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="2" x="-2.35" y="1.25" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="3" x="-2.35" y="0.75" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="4" x="-2.35" y="0.25" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="5" x="-2.35" y="-0.25" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="6" x="-2.35" y="-0.75" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="7" x="-2.35" y="-1.25" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="8" x="-2.35" y="-1.75" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="9" x="-1.75" y="-2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="10" x="-1.25" y="-2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="11" x="-0.75" y="-2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="12" x="-0.25" y="-2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="13" x="0.25" y="-2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="14" x="0.75" y="-2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="15" x="1.25" y="-2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="16" x="1.75" y="-2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="17" x="2.35" y="-1.75" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="18" x="2.35" y="-1.25" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="19" x="2.35" y="-0.75" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="20" x="2.35" y="-0.25" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="21" x="2.35" y="0.25" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="22" x="2.35" y="0.75" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="23" x="2.35" y="1.25" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="24" x="2.35" y="1.75" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="25" x="1.75" y="2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="26" x="1.25" y="2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="27" x="0.75" y="2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="28" x="0.25" y="2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="29" x="-0.25" y="2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="30" x="-0.75" y="2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="31" x="-1.25" y="2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="32" x="-1.75" y="2.35" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<text x="-2.54" y="3.175" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.54" y="-4.445" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-2.5" y1="1.6" x2="-2.05" y2="1.9" layer="51"/>
<rectangle x1="-2.5" y1="1.1" x2="-2.05" y2="1.4" layer="51"/>
<rectangle x1="-2.5" y1="0.6" x2="-2.05" y2="0.9" layer="51"/>
<rectangle x1="-2.5" y1="0.1" x2="-2.05" y2="0.4" layer="51"/>
<rectangle x1="-2.5" y1="-0.4" x2="-2.05" y2="-0.1" layer="51"/>
<rectangle x1="-2.5" y1="-0.9" x2="-2.05" y2="-0.6" layer="51"/>
<rectangle x1="-2.5" y1="-1.4" x2="-2.05" y2="-1.1" layer="51"/>
<rectangle x1="-2.5" y1="-1.9" x2="-2.05" y2="-1.6" layer="51"/>
<rectangle x1="-1.9" y1="-2.5" x2="-1.6" y2="-2.05" layer="51"/>
<rectangle x1="-1.4" y1="-2.5" x2="-1.1" y2="-2.05" layer="51"/>
<rectangle x1="-0.9" y1="-2.5" x2="-0.6" y2="-2.05" layer="51"/>
<rectangle x1="-0.4" y1="-2.5" x2="-0.1" y2="-2.05" layer="51"/>
<rectangle x1="0.1" y1="-2.5" x2="0.4" y2="-2.05" layer="51"/>
<rectangle x1="0.6" y1="-2.5" x2="0.9" y2="-2.05" layer="51"/>
<rectangle x1="1.1" y1="-2.5" x2="1.4" y2="-2.05" layer="51"/>
<rectangle x1="1.6" y1="-2.5" x2="1.9" y2="-2.05" layer="51"/>
<rectangle x1="2.05" y1="-1.9" x2="2.5" y2="-1.6" layer="51"/>
<rectangle x1="2.05" y1="-1.4" x2="2.5" y2="-1.1" layer="51"/>
<rectangle x1="2.05" y1="-0.9" x2="2.5" y2="-0.6" layer="51"/>
<rectangle x1="2.05" y1="-0.4" x2="2.5" y2="-0.1" layer="51"/>
<rectangle x1="2.05" y1="0.1" x2="2.5" y2="0.4" layer="51"/>
<rectangle x1="2.05" y1="0.6" x2="2.5" y2="0.9" layer="51"/>
<rectangle x1="2.05" y1="1.1" x2="2.5" y2="1.4" layer="51"/>
<rectangle x1="2.05" y1="1.6" x2="2.5" y2="1.9" layer="51"/>
<rectangle x1="1.6" y1="2.05" x2="1.9" y2="2.5" layer="51"/>
<rectangle x1="1.1" y1="2.05" x2="1.4" y2="2.5" layer="51"/>
<rectangle x1="0.6" y1="2.05" x2="0.9" y2="2.5" layer="51"/>
<rectangle x1="0.1" y1="2.05" x2="0.4" y2="2.5" layer="51"/>
<rectangle x1="-0.4" y1="2.05" x2="-0.1" y2="2.5" layer="51"/>
<rectangle x1="-0.9" y1="2.05" x2="-0.6" y2="2.5" layer="51"/>
<rectangle x1="-1.4" y1="2.05" x2="-1.1" y2="2.5" layer="51"/>
<rectangle x1="-1.9" y1="2.05" x2="-1.6" y2="2.5" layer="51"/>
<rectangle x1="-1.55" y1="-1.55" x2="1.55" y2="1.55" layer="1"/>
</package>
<package name="TQFP32-08">
<description>&lt;B&gt;Thin Plasic Quad Flat Package&lt;/B&gt; Grid 0.8 mm</description>
<wire x1="3.505" y1="3.505" x2="3.505" y2="-3.505" width="0.1524" layer="21"/>
<wire x1="3.505" y1="-3.505" x2="-3.505" y2="-3.505" width="0.1524" layer="21"/>
<wire x1="-3.505" y1="-3.505" x2="-3.505" y2="3.15" width="0.1524" layer="21"/>
<wire x1="-3.15" y1="3.505" x2="3.505" y2="3.505" width="0.1524" layer="21"/>
<wire x1="-3.15" y1="3.505" x2="-3.505" y2="3.15" width="0.1524" layer="21"/>
<circle x="-2.7432" y="2.7432" radius="0.3592" width="0.1524" layer="21"/>
<smd name="1" x="-4.2926" y="2.8" dx="1.27" dy="0.5588" layer="1"/>
<smd name="2" x="-4.2926" y="2" dx="1.27" dy="0.5588" layer="1"/>
<smd name="3" x="-4.2926" y="1.2" dx="1.27" dy="0.5588" layer="1"/>
<smd name="4" x="-4.2926" y="0.4" dx="1.27" dy="0.5588" layer="1"/>
<smd name="5" x="-4.2926" y="-0.4" dx="1.27" dy="0.5588" layer="1"/>
<smd name="6" x="-4.2926" y="-1.2" dx="1.27" dy="0.5588" layer="1"/>
<smd name="7" x="-4.2926" y="-2" dx="1.27" dy="0.5588" layer="1"/>
<smd name="8" x="-4.2926" y="-2.8" dx="1.27" dy="0.5588" layer="1"/>
<smd name="9" x="-2.8" y="-4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="10" x="-2" y="-4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="11" x="-1.2" y="-4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="12" x="-0.4" y="-4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="13" x="0.4" y="-4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="14" x="1.2" y="-4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="15" x="2" y="-4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="16" x="2.8" y="-4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="17" x="4.2926" y="-2.8" dx="1.27" dy="0.5588" layer="1"/>
<smd name="18" x="4.2926" y="-2" dx="1.27" dy="0.5588" layer="1"/>
<smd name="19" x="4.2926" y="-1.2" dx="1.27" dy="0.5588" layer="1"/>
<smd name="20" x="4.2926" y="-0.4" dx="1.27" dy="0.5588" layer="1"/>
<smd name="21" x="4.2926" y="0.4" dx="1.27" dy="0.5588" layer="1"/>
<smd name="22" x="4.2926" y="1.2" dx="1.27" dy="0.5588" layer="1"/>
<smd name="23" x="4.2926" y="2" dx="1.27" dy="0.5588" layer="1"/>
<smd name="24" x="4.2926" y="2.8" dx="1.27" dy="0.5588" layer="1"/>
<smd name="25" x="2.8" y="4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="26" x="2" y="4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="27" x="1.2" y="4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="28" x="0.4" y="4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="29" x="-0.4" y="4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="30" x="-1.2" y="4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="31" x="-2" y="4.2926" dx="0.5588" dy="1.27" layer="1"/>
<smd name="32" x="-2.8" y="4.2926" dx="0.5588" dy="1.27" layer="1"/>
<text x="-2.7686" y="5.08" size="0.8128" layer="25">&gt;NAME</text>
<text x="-3.0226" y="-1.27" size="0.8128" layer="27">&gt;VALUE</text>
<rectangle x1="-4.5466" y1="2.5714" x2="-3.556" y2="3.0286" layer="51"/>
<rectangle x1="-4.5466" y1="1.7714" x2="-3.556" y2="2.2286" layer="51"/>
<rectangle x1="-4.5466" y1="0.9714" x2="-3.556" y2="1.4286" layer="51"/>
<rectangle x1="-4.5466" y1="0.1714" x2="-3.556" y2="0.6286" layer="51"/>
<rectangle x1="-4.5466" y1="-0.6286" x2="-3.556" y2="-0.1714" layer="51"/>
<rectangle x1="-4.5466" y1="-1.4286" x2="-3.556" y2="-0.9714" layer="51"/>
<rectangle x1="-4.5466" y1="-2.2286" x2="-3.556" y2="-1.7714" layer="51"/>
<rectangle x1="-4.5466" y1="-3.0286" x2="-3.556" y2="-2.5714" layer="51"/>
<rectangle x1="-3.0286" y1="-4.5466" x2="-2.5714" y2="-3.556" layer="51"/>
<rectangle x1="-2.2286" y1="-4.5466" x2="-1.7714" y2="-3.556" layer="51"/>
<rectangle x1="-1.4286" y1="-4.5466" x2="-0.9714" y2="-3.556" layer="51"/>
<rectangle x1="-0.6286" y1="-4.5466" x2="-0.1714" y2="-3.556" layer="51"/>
<rectangle x1="0.1714" y1="-4.5466" x2="0.6286" y2="-3.556" layer="51"/>
<rectangle x1="0.9714" y1="-4.5466" x2="1.4286" y2="-3.556" layer="51"/>
<rectangle x1="1.7714" y1="-4.5466" x2="2.2286" y2="-3.556" layer="51"/>
<rectangle x1="2.5714" y1="-4.5466" x2="3.0286" y2="-3.556" layer="51"/>
<rectangle x1="3.556" y1="-3.0286" x2="4.5466" y2="-2.5714" layer="51"/>
<rectangle x1="3.556" y1="-2.2286" x2="4.5466" y2="-1.7714" layer="51"/>
<rectangle x1="3.556" y1="-1.4286" x2="4.5466" y2="-0.9714" layer="51"/>
<rectangle x1="3.556" y1="-0.6286" x2="4.5466" y2="-0.1714" layer="51"/>
<rectangle x1="3.556" y1="0.1714" x2="4.5466" y2="0.6286" layer="51"/>
<rectangle x1="3.556" y1="0.9714" x2="4.5466" y2="1.4286" layer="51"/>
<rectangle x1="3.556" y1="1.7714" x2="4.5466" y2="2.2286" layer="51"/>
<rectangle x1="3.556" y1="2.5714" x2="4.5466" y2="3.0286" layer="51"/>
<rectangle x1="2.5714" y1="3.556" x2="3.0286" y2="4.5466" layer="51"/>
<rectangle x1="1.7714" y1="3.556" x2="2.2286" y2="4.5466" layer="51"/>
<rectangle x1="0.9714" y1="3.556" x2="1.4286" y2="4.5466" layer="51"/>
<rectangle x1="0.1714" y1="3.556" x2="0.6286" y2="4.5466" layer="51"/>
<rectangle x1="-0.6286" y1="3.556" x2="-0.1714" y2="4.5466" layer="51"/>
<rectangle x1="-1.4286" y1="3.556" x2="-0.9714" y2="4.5466" layer="51"/>
<rectangle x1="-2.2286" y1="3.556" x2="-1.7714" y2="4.5466" layer="51"/>
<rectangle x1="-3.0286" y1="3.556" x2="-2.5714" y2="4.5466" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="ATMEGA48/88/168-TQFP/QFN32">
<wire x1="-25.4" y1="30.48" x2="25.4" y2="30.48" width="0.254" layer="94"/>
<wire x1="25.4" y1="30.48" x2="25.4" y2="-33.02" width="0.254" layer="94"/>
<wire x1="25.4" y1="-33.02" x2="-25.4" y2="-33.02" width="0.254" layer="94"/>
<wire x1="-25.4" y1="-33.02" x2="-25.4" y2="30.48" width="0.254" layer="94"/>
<text x="-25.4" y="33.02" size="1.778" layer="95" rot="MR180">&gt;NAME</text>
<text x="-25.4" y="-35.56" size="1.778" layer="96">&gt;VALUE</text>
<pin name="PB5(SCK/PCINT5)" x="30.48" y="-30.48" length="middle" rot="R180"/>
<pin name="PB7(XTAL2/TOSC2/PCINT7)" x="-30.48" y="7.62" length="middle"/>
<pin name="PB6(XTAL1/TOSC1/PCINT6)" x="-30.48" y="12.7" length="middle"/>
<pin name="GND@1" x="-30.48" y="-27.94" length="middle" direction="pwr"/>
<pin name="VCC@1" x="-30.48" y="0" length="middle" direction="pwr"/>
<pin name="AGND" x="-30.48" y="-22.86" length="middle" direction="pwr"/>
<pin name="AREF" x="-30.48" y="-10.16" length="middle" direction="pas"/>
<pin name="AVCC" x="-30.48" y="-7.62" length="middle" direction="pas"/>
<pin name="PB4(MISO/PCINT4)" x="30.48" y="-27.94" length="middle" rot="R180"/>
<pin name="PB3(MOSI/OC2A/PCINT3)" x="30.48" y="-25.4" length="middle" rot="R180"/>
<pin name="PB2(SS/OC1B/PCINT2)" x="30.48" y="-22.86" length="middle" rot="R180"/>
<pin name="PB1(OC1A/PCINT1)" x="30.48" y="-20.32" length="middle" rot="R180"/>
<pin name="PB0(ICP1/CLKO/PCINT0)" x="30.48" y="-17.78" length="middle" rot="R180"/>
<pin name="PD7(AIN1/PCINT23)" x="30.48" y="-12.7" length="middle" rot="R180"/>
<pin name="PD6(AIN0/OC0A/PCINT22)" x="30.48" y="-10.16" length="middle" rot="R180"/>
<pin name="PD5(T1/OC0B/PCINT21)" x="30.48" y="-7.62" length="middle" rot="R180"/>
<pin name="PD4(T0/XCK/PCINT20)" x="30.48" y="-5.08" length="middle" rot="R180"/>
<pin name="PD3(INT1/OC2B/PCINT19)" x="30.48" y="-2.54" length="middle" rot="R180"/>
<pin name="PD2(INT0/PCINT18)" x="30.48" y="0" length="middle" rot="R180"/>
<pin name="PD1(TXD/PCINT17)" x="30.48" y="2.54" length="middle" rot="R180"/>
<pin name="PD0(RXD/PCINT16)" x="30.48" y="5.08" length="middle" rot="R180"/>
<pin name="PC5(ADC5/SCL/PCINT13)" x="30.48" y="15.24" length="middle" rot="R180"/>
<pin name="PC4(ADC4/SDA/PCINT12)" x="30.48" y="17.78" length="middle" rot="R180"/>
<pin name="PC3(ADC3/PCINT11)" x="30.48" y="20.32" length="middle" rot="R180"/>
<pin name="PC2(ADC2/PCINT10)" x="30.48" y="22.86" length="middle" rot="R180"/>
<pin name="PC1(ADC1/PCINT9)" x="30.48" y="25.4" length="middle" rot="R180"/>
<pin name="PC0(ADC0/PCINT8)" x="30.48" y="27.94" length="middle" rot="R180"/>
<pin name="PC6(/RESET/PCINT14)" x="-30.48" y="27.94" length="middle"/>
<pin name="GND@2" x="-30.48" y="-30.48" length="middle" direction="pwr"/>
<pin name="VCC@2" x="-30.48" y="-2.54" length="middle" direction="pwr"/>
<pin name="ADC7" x="30.48" y="10.16" length="middle" direction="pas" rot="R180"/>
<pin name="ADC6" x="30.48" y="12.7" length="middle" direction="pas" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ATMEGA48/88/168" prefix="IC">
<gates>
<gate name="1" symbol="ATMEGA48/88/168-TQFP/QFN32" x="0" y="0"/>
</gates>
<devices>
<device name="-MU" package="MLF32">
<connects>
<connect gate="1" pin="ADC6" pad="19"/>
<connect gate="1" pin="ADC7" pad="22"/>
<connect gate="1" pin="AGND" pad="21"/>
<connect gate="1" pin="AREF" pad="20"/>
<connect gate="1" pin="AVCC" pad="18"/>
<connect gate="1" pin="GND@1" pad="3"/>
<connect gate="1" pin="GND@2" pad="5"/>
<connect gate="1" pin="PB0(ICP1/CLKO/PCINT0)" pad="12"/>
<connect gate="1" pin="PB1(OC1A/PCINT1)" pad="13"/>
<connect gate="1" pin="PB2(SS/OC1B/PCINT2)" pad="14"/>
<connect gate="1" pin="PB3(MOSI/OC2A/PCINT3)" pad="15"/>
<connect gate="1" pin="PB4(MISO/PCINT4)" pad="16"/>
<connect gate="1" pin="PB5(SCK/PCINT5)" pad="17"/>
<connect gate="1" pin="PB6(XTAL1/TOSC1/PCINT6)" pad="7"/>
<connect gate="1" pin="PB7(XTAL2/TOSC2/PCINT7)" pad="8"/>
<connect gate="1" pin="PC0(ADC0/PCINT8)" pad="23"/>
<connect gate="1" pin="PC1(ADC1/PCINT9)" pad="24"/>
<connect gate="1" pin="PC2(ADC2/PCINT10)" pad="25"/>
<connect gate="1" pin="PC3(ADC3/PCINT11)" pad="26"/>
<connect gate="1" pin="PC4(ADC4/SDA/PCINT12)" pad="27"/>
<connect gate="1" pin="PC5(ADC5/SCL/PCINT13)" pad="28"/>
<connect gate="1" pin="PC6(/RESET/PCINT14)" pad="29"/>
<connect gate="1" pin="PD0(RXD/PCINT16)" pad="30"/>
<connect gate="1" pin="PD1(TXD/PCINT17)" pad="31"/>
<connect gate="1" pin="PD2(INT0/PCINT18)" pad="32"/>
<connect gate="1" pin="PD3(INT1/OC2B/PCINT19)" pad="1"/>
<connect gate="1" pin="PD4(T0/XCK/PCINT20)" pad="2"/>
<connect gate="1" pin="PD5(T1/OC0B/PCINT21)" pad="9"/>
<connect gate="1" pin="PD6(AIN0/OC0A/PCINT22)" pad="10"/>
<connect gate="1" pin="PD7(AIN1/PCINT23)" pad="11"/>
<connect gate="1" pin="VCC@1" pad="4"/>
<connect gate="1" pin="VCC@2" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-AU" package="TQFP32-08">
<connects>
<connect gate="1" pin="ADC6" pad="19"/>
<connect gate="1" pin="ADC7" pad="22"/>
<connect gate="1" pin="AGND" pad="21"/>
<connect gate="1" pin="AREF" pad="20"/>
<connect gate="1" pin="AVCC" pad="18"/>
<connect gate="1" pin="GND@1" pad="3"/>
<connect gate="1" pin="GND@2" pad="5"/>
<connect gate="1" pin="PB0(ICP1/CLKO/PCINT0)" pad="12"/>
<connect gate="1" pin="PB1(OC1A/PCINT1)" pad="13"/>
<connect gate="1" pin="PB2(SS/OC1B/PCINT2)" pad="14"/>
<connect gate="1" pin="PB3(MOSI/OC2A/PCINT3)" pad="15"/>
<connect gate="1" pin="PB4(MISO/PCINT4)" pad="16"/>
<connect gate="1" pin="PB5(SCK/PCINT5)" pad="17"/>
<connect gate="1" pin="PB6(XTAL1/TOSC1/PCINT6)" pad="7"/>
<connect gate="1" pin="PB7(XTAL2/TOSC2/PCINT7)" pad="8"/>
<connect gate="1" pin="PC0(ADC0/PCINT8)" pad="23"/>
<connect gate="1" pin="PC1(ADC1/PCINT9)" pad="24"/>
<connect gate="1" pin="PC2(ADC2/PCINT10)" pad="25"/>
<connect gate="1" pin="PC3(ADC3/PCINT11)" pad="26"/>
<connect gate="1" pin="PC4(ADC4/SDA/PCINT12)" pad="27"/>
<connect gate="1" pin="PC5(ADC5/SCL/PCINT13)" pad="28"/>
<connect gate="1" pin="PC6(/RESET/PCINT14)" pad="29"/>
<connect gate="1" pin="PD0(RXD/PCINT16)" pad="30"/>
<connect gate="1" pin="PD1(TXD/PCINT17)" pad="31"/>
<connect gate="1" pin="PD2(INT0/PCINT18)" pad="32"/>
<connect gate="1" pin="PD3(INT1/OC2B/PCINT19)" pad="1"/>
<connect gate="1" pin="PD4(T0/XCK/PCINT20)" pad="2"/>
<connect gate="1" pin="PD5(T1/OC0B/PCINT21)" pad="9"/>
<connect gate="1" pin="PD6(AIN0/OC0A/PCINT22)" pad="10"/>
<connect gate="1" pin="PD7(AIN1/PCINT23)" pad="11"/>
<connect gate="1" pin="VCC@1" pad="4"/>
<connect gate="1" pin="VCC@2" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="VCC">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VCC" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="VCC" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="#PaJa_konektory">
<description>&lt;B&gt;PaJa_konektory&lt;/B&gt; - knihovna   &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 
&lt;I&gt;(vytvoreno 1.6.2011)&lt;/I&gt;&lt;BR&gt;
Knihovna konektoru do Eagle &lt;I&gt;(od verze 5.6)&lt;/I&gt;&lt;BR&gt;
&lt;BR&gt;
Knihovna obsahuje: 91 soucastek na DPS, 92 do SCHematu&lt;BR&gt;
&lt;BR&gt;
&lt;Author&gt;Copyright (C) PaJa 2011&lt;BR&gt;
http://www.paja-trb.unas.cz&lt;BR&gt;
paja-trb@seznam.cz
&lt;/author&gt;</description>
<packages>
<package name="PSH02-04P">
<wire x1="-5.08" y1="2.54" x2="-3.81" y2="2.54" width="0.127" layer="21"/>
<wire x1="-5.08" y1="2.54" x2="-5.08" y2="-3.175" width="0.127" layer="21"/>
<wire x1="-3.81" y1="2.54" x2="-3.81" y2="1.5875" width="0.127" layer="21"/>
<wire x1="-3.81" y1="2.54" x2="3.81" y2="2.54" width="0.127" layer="21"/>
<wire x1="3.81" y1="2.54" x2="5.08" y2="2.54" width="0.127" layer="21"/>
<wire x1="-5.08" y1="-3.175" x2="5.08" y2="-3.175" width="0.127" layer="21"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-3.175" width="0.127" layer="21"/>
<wire x1="3.81" y1="1.5875" x2="3.81" y2="2.54" width="0.127" layer="21"/>
<wire x1="-3.81" y1="1.5875" x2="3.81" y2="1.5875" width="0.127" layer="21"/>
<circle x="-3.81" y="0" radius="0.5724" width="0.127" layer="102"/>
<circle x="-1.27" y="0" radius="0.5723" width="0.127" layer="102"/>
<circle x="1.27" y="0" radius="0.5724" width="0.127" layer="102"/>
<circle x="3.81" y="0" radius="0.5723" width="0.127" layer="102"/>
<pad name="1" x="-3.81" y="0" drill="1.016" diameter="1.4224" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" diameter="1.4224" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1.016" diameter="1.4224" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1.016" diameter="1.4224" shape="long" rot="R90"/>
<text x="-4.9213" y="2.0638" size="0.254" layer="100">PaJa</text>
<text x="-4.9212" y="-3.0163" size="1.4224" layer="25">&gt;Name</text>
<text x="-4.9212" y="-4.9212" size="1.4224" layer="27">&gt;Value</text>
<rectangle x1="-4.1275" y1="-0.3175" x2="-3.4925" y2="0.3175" layer="51"/>
<rectangle x1="-1.5875" y1="-0.3175" x2="-0.9525" y2="0.3175" layer="51"/>
<rectangle x1="0.9525" y1="-0.3175" x2="1.5875" y2="0.3175" layer="51"/>
<rectangle x1="3.4925" y1="-0.3175" x2="4.1275" y2="0.3175" layer="51"/>
</package>
<package name="PSH02-04W">
<wire x1="-5.08" y1="5.08" x2="-3.81" y2="5.08" width="0.127" layer="21"/>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="1.905" width="0.127" layer="21"/>
<wire x1="-5.08" y1="1.905" x2="-4.445" y2="1.905" width="0.127" layer="21"/>
<wire x1="-3.175" y1="1.905" x2="-1.905" y2="1.905" width="0.127" layer="21"/>
<wire x1="-3.81" y1="5.08" x2="-3.81" y2="13.0175" width="0.127" layer="21"/>
<wire x1="-4.445" y1="1.905" x2="-4.445" y2="2.54" width="0.127" layer="21"/>
<wire x1="-4.445" y1="2.54" x2="-3.175" y2="2.54" width="0.127" layer="21"/>
<wire x1="-3.175" y1="2.54" x2="-3.175" y2="1.905" width="0.127" layer="21"/>
<wire x1="-1.905" y1="1.905" x2="-1.905" y2="2.54" width="0.127" layer="21"/>
<wire x1="-1.905" y1="2.54" x2="-0.635" y2="2.54" width="0.127" layer="21"/>
<wire x1="-0.635" y1="2.54" x2="-0.635" y2="1.905" width="0.127" layer="21"/>
<wire x1="-3.81" y1="5.3975" x2="-3.81" y2="12.7" width="0.6096" layer="51"/>
<wire x1="-1.27" y1="12.7" x2="-1.27" y2="5.3975" width="0.6096" layer="51"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="2.2225" width="0.6096" layer="51"/>
<wire x1="-3.81" y1="2.2225" x2="-3.81" y2="0" width="0.6096" layer="51"/>
<wire x1="-3.81" y1="5.08" x2="3.81" y2="5.08" width="0.127" layer="21"/>
<wire x1="3.81" y1="5.08" x2="5.08" y2="5.08" width="0.127" layer="21"/>
<wire x1="-0.635" y1="1.905" x2="0.635" y2="1.905" width="0.127" layer="21"/>
<wire x1="1.905" y1="1.905" x2="3.175" y2="1.905" width="0.127" layer="21"/>
<wire x1="4.445" y1="1.905" x2="5.08" y2="1.905" width="0.127" layer="21"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="1.905" width="0.127" layer="21"/>
<wire x1="-3.81" y1="13.0175" x2="3.81" y2="13.0175" width="0.127" layer="21"/>
<wire x1="3.81" y1="13.0175" x2="3.81" y2="5.08" width="0.127" layer="21"/>
<wire x1="0.635" y1="1.905" x2="0.635" y2="2.54" width="0.127" layer="21"/>
<wire x1="0.635" y1="2.54" x2="1.905" y2="2.54" width="0.127" layer="21"/>
<wire x1="1.905" y1="2.54" x2="1.905" y2="1.905" width="0.127" layer="21"/>
<wire x1="3.175" y1="1.905" x2="3.175" y2="2.54" width="0.127" layer="21"/>
<wire x1="3.175" y1="2.54" x2="4.445" y2="2.54" width="0.127" layer="21"/>
<wire x1="4.445" y1="2.54" x2="4.445" y2="1.905" width="0.127" layer="21"/>
<wire x1="1.27" y1="5.3975" x2="1.27" y2="12.7" width="0.6096" layer="51"/>
<wire x1="3.81" y1="12.7" x2="3.81" y2="5.3975" width="0.6096" layer="51"/>
<wire x1="3.81" y1="0" x2="3.81" y2="2.2225" width="0.6096" layer="51"/>
<wire x1="1.27" y1="2.2225" x2="1.27" y2="0" width="0.6096" layer="51"/>
<circle x="-3.81" y="0" radius="0.5724" width="0.127" layer="102"/>
<circle x="-1.27" y="0" radius="0.5723" width="0.127" layer="102"/>
<circle x="1.27" y="0" radius="0.5724" width="0.127" layer="102"/>
<circle x="3.81" y="0" radius="0.5723" width="0.127" layer="102"/>
<pad name="1" x="-3.81" y="0" drill="1.016" diameter="1.4224" shape="long" rot="R90"/>
<pad name="2" x="-1.27" y="0" drill="1.016" diameter="1.4224" shape="long" rot="R90"/>
<pad name="3" x="1.27" y="0" drill="1.016" diameter="1.4224" shape="long" rot="R90"/>
<pad name="4" x="3.81" y="0" drill="1.016" diameter="1.4224" shape="long" rot="R90"/>
<text x="-3.0163" y="2.0638" size="0.254" layer="100">PaJa</text>
<text x="-4.445" y="3.175" size="1.4224" layer="25">&gt;Name</text>
<text x="-1.905" y="5.3975" size="1.4224" layer="27" rot="R90">&gt;Value</text>
<rectangle x1="-1.5875" y1="0" x2="-0.9525" y2="2.54" layer="51"/>
<rectangle x1="-4.1275" y1="0" x2="-3.4925" y2="2.54" layer="51"/>
<rectangle x1="-4.1275" y1="5.08" x2="-3.4925" y2="12.7" layer="51"/>
<rectangle x1="-1.5875" y1="5.08" x2="-0.9525" y2="12.7" layer="51"/>
<rectangle x1="3.4925" y1="0" x2="4.1275" y2="2.54" layer="51"/>
<rectangle x1="0.9525" y1="0" x2="1.5875" y2="2.54" layer="51"/>
<rectangle x1="0.9525" y1="5.08" x2="1.5875" y2="12.7" layer="51"/>
<rectangle x1="3.4925" y1="5.08" x2="4.1275" y2="12.7" layer="51"/>
</package>
<package name="MLW06G">
<wire x1="-6.35" y1="3.175" x2="6.35" y2="3.175" width="0.127" layer="21"/>
<wire x1="6.35" y1="-3.175" x2="6.35" y2="3.175" width="0.127" layer="21"/>
<wire x1="-6.35" y1="3.175" x2="-6.35" y2="-3.175" width="0.127" layer="21"/>
<wire x1="-7.62" y1="4.445" x2="-6.0325" y2="4.445" width="0.127" layer="21"/>
<wire x1="7.62" y1="-4.445" x2="7.62" y2="4.445" width="0.127" layer="21"/>
<wire x1="-7.62" y1="4.445" x2="-7.62" y2="-4.445" width="0.127" layer="21"/>
<wire x1="2.032" y1="-2.413" x2="-2.032" y2="-2.413" width="0.127" layer="21"/>
<wire x1="-2.032" y1="-3.175" x2="-2.032" y2="-2.413" width="0.127" layer="21"/>
<wire x1="-2.032" y1="-3.175" x2="-6.35" y2="-3.175" width="0.127" layer="21"/>
<wire x1="-2.032" y1="-3.175" x2="-2.032" y2="-3.429" width="0.127" layer="21"/>
<wire x1="2.032" y1="-2.413" x2="2.032" y2="-3.175" width="0.127" layer="21"/>
<wire x1="6.0325" y1="4.445" x2="7.62" y2="4.445" width="0.127" layer="21"/>
<wire x1="2.8575" y1="4.445" x2="5.3975" y2="4.445" width="0.127" layer="21"/>
<wire x1="-5.3975" y1="4.445" x2="2.2225" y2="4.445" width="0.127" layer="21"/>
<wire x1="7.62" y1="-4.445" x2="2.032" y2="-4.445" width="0.127" layer="21"/>
<wire x1="2.032" y1="-4.445" x2="-2.032" y2="-4.445" width="0.127" layer="21"/>
<wire x1="6.35" y1="-3.175" x2="2.032" y2="-3.175" width="0.127" layer="21"/>
<wire x1="2.032" y1="-3.175" x2="2.032" y2="-3.429" width="0.127" layer="21"/>
<wire x1="2.032" y1="-3.429" x2="2.032" y2="-4.445" width="0.127" layer="21"/>
<wire x1="2.032" y1="-3.429" x2="6.604" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="6.604" y1="-3.429" x2="6.604" y2="3.429" width="0.0508" layer="21"/>
<wire x1="6.604" y1="3.429" x2="-6.604" y2="3.429" width="0.0508" layer="21"/>
<wire x1="-6.604" y1="3.429" x2="-6.604" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="-6.604" y1="-3.429" x2="-2.032" y2="-3.429" width="0.0508" layer="21"/>
<wire x1="-2.032" y1="-3.429" x2="-2.032" y2="-4.445" width="0.127" layer="21"/>
<wire x1="-2.032" y1="-4.445" x2="-3.81" y2="-4.445" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-4.318" x2="-3.81" y2="-4.445" width="0.127" layer="21"/>
<wire x1="-3.81" y1="-4.318" x2="-5.3975" y2="-4.318" width="0.127" layer="21"/>
<wire x1="-5.3975" y1="-4.445" x2="-5.3975" y2="-4.318" width="0.127" layer="21"/>
<wire x1="-5.3975" y1="-4.445" x2="-7.62" y2="-4.445" width="0.127" layer="21"/>
<wire x1="-6.0325" y1="4.445" x2="-5.3975" y2="4.445" width="0.127" layer="21" curve="-180"/>
<wire x1="2.2225" y1="4.445" x2="2.8575" y2="4.445" width="0.127" layer="21" curve="-180"/>
<wire x1="5.3975" y1="4.445" x2="6.0325" y2="4.445" width="0.127" layer="21" curve="-180"/>
<circle x="-2.54" y="1.27" radius="0.449" width="0.127" layer="102"/>
<circle x="0" y="1.27" radius="0.449" width="0.127" layer="102"/>
<circle x="2.54" y="1.27" radius="0.449" width="0.127" layer="102"/>
<circle x="2.54" y="-1.27" radius="0.449" width="0.127" layer="102"/>
<circle x="0" y="-1.27" radius="0.449" width="0.127" layer="102"/>
<circle x="-2.54" y="-1.27" radius="0.449" width="0.127" layer="102"/>
<pad name="1" x="-2.54" y="-1.27" drill="0.9144" diameter="1.778" shape="square"/>
<pad name="2" x="-2.54" y="1.27" drill="0.9144" diameter="1.778" shape="octagon"/>
<pad name="3" x="0" y="-1.27" drill="0.9144" diameter="1.778" shape="octagon"/>
<pad name="4" x="0" y="1.27" drill="0.9144" diameter="1.778" shape="octagon"/>
<pad name="5" x="2.54" y="-1.27" drill="0.9144" diameter="1.778" shape="octagon"/>
<pad name="6" x="2.54" y="1.27" drill="0.9144" diameter="1.778" shape="octagon"/>
<text x="-0.381" y="-4.064" size="1.27" layer="101" ratio="10">6</text>
<text x="-4.1275" y="5.08" size="1.778" layer="25">&gt;NAME</text>
<text x="-4.1275" y="-6.6675" size="1.778" layer="27">&gt;VALUE</text>
<text x="-5.08" y="-1.905" size="1.27" layer="101" ratio="10">1</text>
<text x="-5.08" y="0.635" size="1.27" layer="101" ratio="10">2</text>
<text x="6.35" y="-4.1275" size="0.254" layer="100">PaJa</text>
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51"/>
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51"/>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51"/>
</package>
<package name="MLW06A">
<description>&lt;b&gt;HARTING&lt;/b&gt;</description>
<wire x1="-5.08" y1="10.287" x2="-2.54" y2="10.287" width="0.254" layer="21"/>
<wire x1="-2.54" y1="10.287" x2="-3.81" y2="7.747" width="0.254" layer="21"/>
<wire x1="-3.81" y1="7.747" x2="-5.08" y2="10.287" width="0.254" layer="21"/>
<wire x1="-2.159" y1="10.922" x2="-2.159" y2="4.445" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="10.922" x2="2.159" y2="10.922" width="0.1524" layer="21"/>
<wire x1="2.159" y1="10.922" x2="2.159" y2="4.445" width="0.1524" layer="21"/>
<wire x1="2.159" y1="10.922" x2="7.62" y2="10.922" width="0.1524" layer="21"/>
<wire x1="2.159" y1="4.445" x2="-2.159" y2="4.445" width="0.1524" layer="21"/>
<wire x1="2.159" y1="3.429" x2="-2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="4.445" x2="-2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="2.159" y1="4.445" x2="2.159" y2="3.429" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="2.032" x2="-1.905" y2="2.032" width="0.1524" layer="51"/>
<wire x1="-1.905" y1="2.032" x2="-0.635" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="2.032" x2="0.635" y2="2.032" width="0.1524" layer="51"/>
<wire x1="0.635" y1="2.032" x2="1.905" y2="2.032" width="0.1524" layer="21"/>
<wire x1="1.905" y1="2.032" x2="3.175" y2="2.032" width="0.1524" layer="51"/>
<wire x1="0" y1="10.16" x2="0" y2="10.414" width="0.508" layer="21"/>
<wire x1="3.302" y1="10.287" x2="3.302" y2="7.493" width="0.1524" layer="21"/>
<wire x1="3.302" y1="7.493" x2="7.112" y2="7.493" width="0.1524" layer="21"/>
<wire x1="7.112" y1="10.287" x2="7.112" y2="7.493" width="0.1524" layer="21"/>
<wire x1="7.112" y1="10.287" x2="3.302" y2="10.287" width="0.1524" layer="21"/>
<wire x1="7.62" y1="10.922" x2="7.62" y2="2.032" width="0.1524" layer="21"/>
<wire x1="7.62" y1="2.032" x2="6.477" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-2.159" y1="10.922" x2="-7.62" y2="10.922" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="10.922" x2="-7.62" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-7.62" y1="2.032" x2="-6.477" y2="2.032" width="0.1524" layer="21"/>
<wire x1="5.461" y1="2.032" x2="5.461" y2="1.397" width="0.1524" layer="21"/>
<wire x1="5.461" y1="2.032" x2="3.175" y2="2.032" width="0.1524" layer="21"/>
<wire x1="5.461" y1="1.397" x2="6.477" y2="1.397" width="0.1524" layer="21"/>
<wire x1="6.477" y1="2.032" x2="6.477" y2="1.397" width="0.1524" layer="21"/>
<wire x1="6.477" y1="2.032" x2="5.461" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-5.461" y1="2.032" x2="-5.461" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-5.461" y1="2.032" x2="-3.175" y2="2.032" width="0.1524" layer="21"/>
<wire x1="-5.461" y1="1.397" x2="-6.477" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="2.032" x2="-6.477" y2="1.397" width="0.1524" layer="21"/>
<wire x1="-6.477" y1="2.032" x2="-5.461" y2="2.032" width="0.1524" layer="21"/>
<circle x="-2.54" y="1.27" radius="0.449" width="0.127" layer="102"/>
<circle x="0" y="1.27" radius="0.449" width="0.127" layer="102"/>
<circle x="2.54" y="1.27" radius="0.449" width="0.127" layer="102"/>
<circle x="2.54" y="-1.27" radius="0.449" width="0.127" layer="102"/>
<circle x="0" y="-1.27" radius="0.449" width="0.127" layer="102"/>
<circle x="-2.54" y="-1.27" radius="0.449" width="0.127" layer="102"/>
<pad name="1" x="-2.54" y="-1.27" drill="0.9144" diameter="1.778" shape="square"/>
<pad name="2" x="-2.54" y="1.27" drill="0.9144" diameter="1.778" shape="octagon"/>
<pad name="3" x="0" y="-1.27" drill="0.9144" diameter="1.778" shape="octagon"/>
<pad name="4" x="0" y="1.27" drill="0.9144" diameter="1.778" shape="octagon"/>
<pad name="5" x="2.54" y="-1.27" drill="0.9144" diameter="1.778" shape="octagon"/>
<pad name="6" x="2.54" y="1.27" drill="0.9144" diameter="1.778" shape="octagon"/>
<text x="-4.6228" y="-1.6764" size="1.27" layer="101" ratio="10">1</text>
<text x="-4.6482" y="0.3556" size="1.27" layer="101" ratio="10">2</text>
<text x="-7.6454" y="11.43" size="1.778" layer="25" ratio="10">&gt;NAME</text>
<text x="0.6096" y="11.43" size="1.778" layer="27" ratio="10">&gt;VALUE</text>
<text x="4.8895" y="8.128" size="1.524" layer="101" ratio="10">6</text>
<rectangle x1="-0.254" y1="4.445" x2="0.254" y2="10.287" layer="21"/>
<rectangle x1="-4.953" y1="9.779" x2="-2.667" y2="10.287" layer="21"/>
<rectangle x1="-4.699" y1="9.271" x2="-2.921" y2="9.779" layer="21"/>
<rectangle x1="-4.445" y1="8.763" x2="-3.175" y2="9.271" layer="21"/>
<rectangle x1="-4.191" y1="8.255" x2="-3.429" y2="8.763" layer="21"/>
<rectangle x1="-3.937" y1="8.001" x2="-3.683" y2="8.255" layer="21"/>
<rectangle x1="-2.794" y1="0.381" x2="-2.286" y2="2.032" layer="51"/>
<rectangle x1="-2.794" y1="-0.381" x2="-2.286" y2="0.381" layer="21"/>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-0.381" layer="51"/>
<rectangle x1="-0.254" y1="0.381" x2="0.254" y2="2.032" layer="51"/>
<rectangle x1="-0.254" y1="-0.381" x2="0.254" y2="0.381" layer="21"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-0.381" layer="51"/>
<rectangle x1="2.286" y1="0.381" x2="2.794" y2="2.032" layer="51"/>
<rectangle x1="2.286" y1="-0.381" x2="2.794" y2="0.381" layer="21"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-0.381" layer="51"/>
<rectangle x1="-0.254" y1="1.016" x2="0.254" y2="1.524" layer="51"/>
<rectangle x1="-2.794" y1="1.016" x2="-2.286" y2="1.524" layer="51"/>
<rectangle x1="2.286" y1="1.016" x2="2.794" y2="1.524" layer="51"/>
<rectangle x1="-0.254" y1="-1.524" x2="0.254" y2="-1.016" layer="51"/>
<rectangle x1="-2.794" y1="-1.524" x2="-2.286" y2="-1.016" layer="51"/>
<rectangle x1="2.286" y1="-1.524" x2="2.794" y2="-1.016" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="S1G4">
<wire x1="-4.445" y1="1.27" x2="-4.445" y2="5.715" width="0.4064" layer="94"/>
<wire x1="2.54" y1="3.81" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="0" y1="3.81" x2="0" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="3.81" x2="-2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="6.985" y1="5.715" x2="-4.445" y2="5.715" width="0.4064" layer="94"/>
<wire x1="-4.445" y1="1.27" x2="6.985" y2="1.27" width="0.4064" layer="94"/>
<wire x1="6.985" y1="5.715" x2="6.985" y2="1.27" width="0.4064" layer="94"/>
<wire x1="5.08" y1="3.81" x2="5.08" y2="2.54" width="0.6096" layer="94"/>
<text x="9.3662" y="0.1587" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<text x="-5.08" y="0.4762" size="1.778" layer="95" rot="R90">&gt;Part</text>
<text x="6.6675" y="1.5875" size="0.254" layer="100" rot="R90">PaJa</text>
<pin name="1" x="-2.54" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R90"/>
<pin name="2" x="0" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R90"/>
<pin name="3" x="2.54" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R90"/>
<pin name="4" x="5.08" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R90"/>
</symbol>
<symbol name="ML06">
<wire x1="3.81" y1="-5.08" x2="-3.81" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="5.08" x2="-3.81" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="-3.81" y1="5.08" x2="3.81" y2="5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="2.54" x2="-1.27" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="0" x2="-1.27" y2="0" width="0.6096" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-1.27" y2="-2.54" width="0.6096" layer="94"/>
<text x="-3.81" y="-7.62" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.81" y="5.842" size="1.778" layer="95">&gt;NAME</text>
<text x="2.54" y="-4.7625" size="0.254" layer="100">PaJa</text>
<pin name="1" x="7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="-7.62" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="3" x="7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="-7.62" y="0" visible="pad" length="middle" direction="pas" swaplevel="1"/>
<pin name="5" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="6" x="-7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PSH02-04" prefix="K" uservalue="yes">
<description>&lt;B&gt;Konektory se zamkem&lt;/B&gt; - vidlice - 4pin</description>
<gates>
<gate name="KON" symbol="S1G4" x="0" y="-2.54" swaplevel="2"/>
</gates>
<devices>
<device name="P" package="PSH02-04P">
<connects>
<connect gate="KON" pin="1" pad="1"/>
<connect gate="KON" pin="2" pad="2"/>
<connect gate="KON" pin="3" pad="3"/>
<connect gate="KON" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="W" package="PSH02-04W">
<connects>
<connect gate="KON" pin="1" pad="1"/>
<connect gate="KON" pin="2" pad="2"/>
<connect gate="KON" pin="3" pad="3"/>
<connect gate="KON" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MLW06" prefix="CON">
<description>&lt;B&gt;Konektory MLW&lt;/B&gt; - vidlice - 6x</description>
<gates>
<gate name="C" symbol="ML06" x="0" y="0" swaplevel="1"/>
</gates>
<devices>
<device name="" package="MLW06G">
<connects>
<connect gate="C" pin="1" pad="1"/>
<connect gate="C" pin="2" pad="2"/>
<connect gate="C" pin="3" pad="3"/>
<connect gate="C" pin="4" pad="4"/>
<connect gate="C" pin="5" pad="5"/>
<connect gate="C" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_90°" package="MLW06A">
<connects>
<connect gate="C" pin="1" pad="1"/>
<connect gate="C" pin="2" pad="2"/>
<connect gate="C" pin="3" pad="3"/>
<connect gate="C" pin="4" pad="4"/>
<connect gate="C" pin="5" pad="5"/>
<connect gate="C" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="#PaJa_30">
<description>&lt;B&gt;PaJa 30&lt;/B&gt; - knihovna   &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 
&lt;I&gt;(vytvoreno 1.6.2011)&lt;/I&gt;&lt;BR&gt;
Univerzální knihovna soucastek do Eagle &lt;I&gt;(od verze 5.6)&lt;/I&gt;&lt;BR&gt;
&lt;BR&gt;
Knihovna obsahuje: 196 soucastek na DPS, 298 do SCHematu&lt;BR&gt;
&lt;BR&gt;
&lt;Author&gt;Copyright (C) PaJa 2001-2011&lt;BR&gt;
http://www.paja-trb.unas.cz&lt;BR&gt;
paja-trb@seznam.cz
&lt;/author&gt;</description>
<packages>
<package name="C-2,5">
<circle x="-1.272" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="1.272" y="0" radius="0.477" width="0.127" layer="102"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" diameter="1.27" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="0.8128" diameter="1.27" shape="long" rot="R90"/>
<text x="-1.6704" y="1.3513" size="1.016" layer="25" font="vector">&gt;Name</text>
<text x="-1.6709" y="-2.3853" size="1.016" layer="27" font="vector">&gt;Value</text>
<text x="0.159" y="0.318" size="0.254" layer="100" font="vector" rot="R90">PaJa</text>
<rectangle x1="-0.5556" y1="-1.27" x2="-0.1746" y2="1.27" layer="21"/>
<rectangle x1="0.1746" y1="-1.27" x2="0.5556" y2="1.27" layer="21"/>
<rectangle x1="-0.7938" y1="-0.1588" x2="-0.5556" y2="0.1588" layer="51"/>
<rectangle x1="0.5556" y1="-0.1588" x2="0.7938" y2="0.1588" layer="51"/>
</package>
<package name="C-5">
<circle x="-2.544" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="2.544" y="0" radius="0.477" width="0.127" layer="102"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.9304" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.9304" shape="octagon"/>
<text x="0.795" y="0.954" size="1.016" layer="25" font="vector">&gt;Name</text>
<text x="0.795" y="-1.9085" size="1.016" layer="27" font="vector">&gt;Value</text>
<text x="0.159" y="0.3182" size="0.254" layer="100" font="vector" rot="R90">PaJa</text>
<rectangle x1="-0.7143" y1="-1.27" x2="-0.238" y2="1.27" layer="21"/>
<rectangle x1="0.2381" y1="-1.27" x2="0.7144" y2="1.27" layer="21"/>
<rectangle x1="-2.0638" y1="-0.1588" x2="-1.4288" y2="0.1588" layer="51"/>
<rectangle x1="1.4288" y1="-0.1588" x2="2.0638" y2="0.1588" layer="51"/>
<rectangle x1="-1.4288" y1="-0.1588" x2="-0.635" y2="0.1588" layer="21"/>
<rectangle x1="0.635" y1="-0.1588" x2="1.4288" y2="0.1588" layer="21"/>
</package>
<package name="C-7,5">
<circle x="-3.814" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="3.814" y="0" radius="0.477" width="0.127" layer="102"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" diameter="1.9304" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" diameter="1.9304" shape="octagon"/>
<text x="0.795" y="0.954" size="1.016" layer="25" font="vector">&gt;Name</text>
<text x="0.795" y="-1.9085" size="1.016" layer="27" font="vector">&gt;Value</text>
<text x="0.159" y="0.477" size="0.254" layer="100" font="vector" rot="R90">PaJa</text>
<rectangle x1="-0.7155" y1="-1.431" x2="-0.2385" y2="1.431" layer="21"/>
<rectangle x1="0.2385" y1="-1.431" x2="0.7155" y2="1.431" layer="21"/>
<rectangle x1="-2.6988" y1="-0.1588" x2="-0.635" y2="0.1588" layer="21"/>
<rectangle x1="0.635" y1="-0.1588" x2="2.6988" y2="0.1588" layer="21"/>
<rectangle x1="-3.3338" y1="-0.1588" x2="-2.6988" y2="0.1588" layer="51"/>
<rectangle x1="2.6988" y1="-0.1588" x2="3.3338" y2="0.1588" layer="51"/>
</package>
<package name="C-10">
<wire x1="-6.35" y1="2.6035" x2="-6.35" y2="-2.6035" width="0.127" layer="21"/>
<wire x1="-6.35" y1="-2.6035" x2="6.35" y2="-2.6035" width="0.127" layer="21"/>
<wire x1="6.35" y1="-2.6035" x2="6.35" y2="2.6035" width="0.127" layer="21"/>
<wire x1="6.35" y1="2.6035" x2="-6.35" y2="2.6035" width="0.127" layer="21"/>
<circle x="-5.08" y="0" radius="0.4763" width="0.127" layer="102"/>
<circle x="5.08" y="0" radius="0.4762" width="0.127" layer="102"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="2.1844" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" diameter="2.1844" shape="octagon"/>
<text x="0.159" y="0.3182" size="0.254" layer="100" font="vector" rot="R90">PaJa</text>
<text x="-4.0444" y="1.1525" size="1.27" layer="25" font="vector">&gt;Name</text>
<text x="-4.3507" y="-2.4225" size="1.27" layer="27" font="vector">&gt;Value</text>
<rectangle x1="-0.7144" y1="-1.27" x2="-0.2381" y2="1.27" layer="21"/>
<rectangle x1="0.238" y1="-1.27" x2="0.7143" y2="1.27" layer="21"/>
<rectangle x1="-4.6038" y1="-0.1588" x2="-3.81" y2="0.1588" layer="51"/>
<rectangle x1="3.81" y1="-0.1588" x2="4.6038" y2="0.1588" layer="51"/>
<rectangle x1="-3.81" y1="-0.1588" x2="-0.635" y2="0.1588" layer="21"/>
<rectangle x1="0.635" y1="-0.1588" x2="3.81" y2="0.1588" layer="21"/>
</package>
<package name="1206">
<description>&lt;B&gt;SMD&lt;/B&gt; - velikost 1206</description>
<wire x1="-1.0541" y1="0.7938" x2="-0.7938" y2="0.7938" width="0.127" layer="51"/>
<wire x1="-0.7938" y1="0.7938" x2="0.7938" y2="0.7938" width="0.127" layer="21"/>
<wire x1="0.7938" y1="0.7938" x2="1.0541" y2="0.7938" width="0.127" layer="51"/>
<wire x1="-1.0541" y1="-0.7938" x2="-0.7938" y2="-0.7938" width="0.127" layer="51"/>
<wire x1="-0.7938" y1="-0.7938" x2="0.7938" y2="-0.7938" width="0.127" layer="21"/>
<wire x1="0.7938" y1="-0.7938" x2="1.0541" y2="-0.7938" width="0.127" layer="51"/>
<wire x1="1.0541" y1="0.7938" x2="1.0541" y2="-0.7938" width="0.127" layer="51"/>
<wire x1="-1.0541" y1="0.7938" x2="-1.0541" y2="-0.7938" width="0.127" layer="51"/>
<smd name="1" x="-1.5875" y="0" dx="1.143" dy="1.7018" layer="1"/>
<smd name="2" x="1.5875" y="0" dx="1.143" dy="1.7018" layer="1"/>
<text x="-0.3175" y="-1.1906" size="0.254" layer="100" font="vector">PaJa</text>
<text x="-0.7938" y="-0.4763" size="1.016" layer="25" font="vector">&gt;Name</text>
<text x="-0.7938" y="0.9525" size="1.016" layer="27" font="vector">&gt;Value</text>
<rectangle x1="-1.4541" y1="-0.7874" x2="-0.9461" y2="0.7874" layer="51"/>
<rectangle x1="0.9461" y1="-0.7874" x2="1.4541" y2="0.7874" layer="51"/>
</package>
<package name="0805">
<description>&lt;B&gt;SMD&lt;/B&gt; - velikost 0805</description>
<wire x1="-0.3226" y1="0.5645" x2="-0.5645" y2="0.5645" width="0.127" layer="51"/>
<wire x1="-0.5645" y1="0.5645" x2="-0.5645" y2="-0.5645" width="0.127" layer="51"/>
<wire x1="-0.5645" y1="-0.5645" x2="-0.3226" y2="-0.5645" width="0.127" layer="51"/>
<wire x1="0.3226" y1="0.5645" x2="0.5645" y2="0.5645" width="0.127" layer="51"/>
<wire x1="0.5645" y1="0.5645" x2="0.5645" y2="-0.5645" width="0.127" layer="51"/>
<wire x1="0.5645" y1="-0.5645" x2="0.3226" y2="-0.5645" width="0.127" layer="51"/>
<wire x1="-0.3226" y1="0.5645" x2="0.3226" y2="0.5645" width="0.127" layer="21"/>
<wire x1="0.3226" y1="-0.5645" x2="-0.3226" y2="-0.5645" width="0.127" layer="21"/>
<smd name="1" x="-0.9525" y="0" dx="1.016" dy="1.4224" layer="1"/>
<smd name="2" x="0.9525" y="0" dx="1.016" dy="1.4224" layer="1"/>
<text x="-1.397" y="-1.6351" size="0.8128" layer="27" font="vector" ratio="10">&gt;VALUE</text>
<text x="-1.3177" y="0.8413" size="0.8128" layer="25" font="vector" ratio="10">&gt;NAME</text>
<text x="0.3956" y="-0.4763" size="0.254" layer="100" font="vector" rot="R90">PaJa</text>
<rectangle x1="0.4064" y1="-0.6096" x2="0.9144" y2="0.6096" layer="51"/>
<rectangle x1="-0.9144" y1="-0.6096" x2="-0.4064" y2="0.6096" layer="51"/>
</package>
<package name="LED_10">
<description>&lt;B&gt;LED dioda&lt;/B&gt; - 10mm prumer</description>
<wire x1="-1.268" y1="-0.446" x2="-1.268" y2="-1.27" width="0.127" layer="51"/>
<wire x1="1.272" y1="-1.27" x2="1.272" y2="-0.446" width="0.127" layer="51"/>
<wire x1="-0.633" y1="-2.667" x2="0.637" y2="-1.905" width="0.127" layer="21"/>
<wire x1="0.637" y1="-1.905" x2="1.27" y2="-1.905" width="0.127" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="-1.27" width="0.127" layer="21"/>
<wire x1="1.27" y1="-1.27" x2="1.272" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0.637" y1="-1.905" x2="-0.633" y2="-1.143" width="0.127" layer="21"/>
<wire x1="-0.347" y1="-3.0478" x2="0.415" y2="-3.8098" width="0.127" layer="21"/>
<wire x1="0.288" y1="-2.6668" x2="1.05" y2="-3.4288" width="0.127" layer="21"/>
<wire x1="0.034" y1="-3.6828" x2="0.288" y2="-3.4288" width="0.127" layer="21"/>
<wire x1="0.288" y1="-3.4288" x2="0.415" y2="-3.8098" width="0.127" layer="21"/>
<wire x1="0.415" y1="-3.8098" x2="0.034" y2="-3.6828" width="0.127" layer="21"/>
<wire x1="1.05" y1="-3.4288" x2="0.669" y2="-3.3018" width="0.127" layer="21"/>
<wire x1="0.669" y1="-3.3018" x2="0.923" y2="-3.0478" width="0.127" layer="21"/>
<wire x1="0.923" y1="-3.0478" x2="1.05" y2="-3.4288" width="0.127" layer="21"/>
<wire x1="0.796" y1="-3.3018" x2="0.923" y2="-3.1748" width="0.127" layer="21"/>
<wire x1="0.161" y1="-3.6828" x2="0.288" y2="-3.5558" width="0.127" layer="21"/>
<wire x1="0.637" y1="-2.667" x2="0.637" y2="-1.905" width="0.127" layer="21"/>
<wire x1="0.637" y1="-1.905" x2="0.637" y2="-1.143" width="0.127" layer="21"/>
<wire x1="-1.268" y1="-1.27" x2="-1.27" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-1.27" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.633" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-0.633" y1="-1.143" x2="-0.633" y2="-2.667" width="0.127" layer="21"/>
<wire x1="3.81" y1="-2.2225" x2="3.81" y2="2.2225" width="0.127" layer="21"/>
<wire x1="3.81" y1="-2.2225" x2="3.81" y2="2.2225" width="0.127" layer="21" curve="-299.487126"/>
<circle x="-1.272" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="1.272" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="0" y="0" radius="3.81" width="0.127" layer="51"/>
<pad name="K" x="1.27" y="0" drill="0.8128" diameter="1.9304" shape="square"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" diameter="1.9304"/>
<text x="-2.2268" y="1.4225" size="1.27" layer="25" font="vector">&gt;Name</text>
<text x="5.2472" y="-2.8622" size="1.27" layer="27" font="vector" rot="R90">&gt;Value</text>
<text x="0.793" y="-2.385" size="0.254" layer="100" font="vector">PaJa</text>
</package>
<package name="LED_3">
<description>&lt;B&gt;LED dioda&lt;/B&gt; - 3mm prumer</description>
<wire x1="-0.381" y1="-0.381" x2="-0.381" y2="-0.889" width="0.127" layer="51"/>
<wire x1="-0.381" y1="-1.397" x2="0.381" y2="-0.889" width="0.127" layer="51"/>
<wire x1="0.381" y1="-0.889" x2="0.889" y2="-0.889" width="0.127" layer="51"/>
<wire x1="0.381" y1="-0.889" x2="-0.381" y2="-0.381" width="0.127" layer="51"/>
<wire x1="-0.635" y1="0.508" x2="0.127" y2="1.27" width="0.127" layer="51"/>
<wire x1="0" y1="0.127" x2="0.762" y2="0.889" width="0.127" layer="51"/>
<wire x1="-0.254" y1="1.143" x2="0" y2="0.889" width="0.127" layer="51"/>
<wire x1="0" y1="0.889" x2="0.127" y2="1.27" width="0.127" layer="51"/>
<wire x1="0.127" y1="1.27" x2="-0.254" y2="1.143" width="0.127" layer="51"/>
<wire x1="0.762" y1="0.889" x2="0.381" y2="0.762" width="0.127" layer="51"/>
<wire x1="0.381" y1="0.762" x2="0.635" y2="0.508" width="0.127" layer="51"/>
<wire x1="0.635" y1="0.508" x2="0.762" y2="0.889" width="0.127" layer="51"/>
<wire x1="0.508" y1="0.762" x2="0.635" y2="0.635" width="0.127" layer="51"/>
<wire x1="-0.127" y1="1.143" x2="0" y2="1.016" width="0.127" layer="51"/>
<wire x1="0.381" y1="-1.397" x2="0.381" y2="-0.889" width="0.127" layer="51"/>
<wire x1="0.381" y1="-0.889" x2="0.381" y2="-0.381" width="0.127" layer="51"/>
<wire x1="0.889" y1="-0.889" x2="1.1685" y2="-0.5239" width="0.127" layer="51"/>
<wire x1="-0.8889" y1="-0.889" x2="-1.0921" y2="-0.5238" width="0.127" layer="51"/>
<wire x1="-0.8889" y1="-0.889" x2="-0.381" y2="-0.889" width="0.127" layer="51"/>
<wire x1="-0.381" y1="-0.889" x2="-0.381" y2="-1.397" width="0.127" layer="51"/>
<wire x1="-1.5081" y1="0.4763" x2="1.4289" y2="0.7145" width="0.127" layer="21" curve="-135.860035" cap="flat"/>
<wire x1="-1.5081" y1="-0.4763" x2="1.4288" y2="-0.7144" width="0.127" layer="21" curve="135.855325" cap="flat"/>
<wire x1="1.4288" y1="0.7144" x2="1.4288" y2="0.4763" width="0.127" layer="21"/>
<wire x1="1.4288" y1="-0.7144" x2="1.4288" y2="-0.4763" width="0.127" layer="21"/>
<wire x1="1.4288" y1="0.4763" x2="1.4288" y2="-0.4763" width="0.127" layer="51"/>
<wire x1="-1.5081" y1="0.4763" x2="-1.5081" y2="-0.4763" width="0.127" layer="51" curve="35.055137" cap="flat"/>
<circle x="-1.272" y="0" radius="0.5028" width="0.127" layer="102"/>
<circle x="1.272" y="0" radius="0.477" width="0.127" layer="102"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" diameter="1.778"/>
<pad name="K" x="1.27" y="0" drill="0.8128" diameter="1.778" shape="square"/>
<text x="-2.544" y="1.749" size="1.27" layer="25" font="vector">&gt;Name</text>
<text x="-2.703" y="-3.021" size="1.27" layer="27" font="vector">&gt;Value</text>
<text x="-0.318" y="0.636" size="0.254" layer="100" font="vector" rot="R270">PaJa</text>
</package>
<package name="LED_5">
<description>&lt;B&gt;LED dioda&lt;/B&gt; - 5mm prumer</description>
<wire x1="-1.268" y1="-0.446" x2="-1.268" y2="-1.27" width="0.127" layer="51"/>
<wire x1="1.272" y1="-1.27" x2="1.272" y2="-0.446" width="0.127" layer="51"/>
<wire x1="-0.633" y1="-0.508" x2="-0.633" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-0.633" y1="-2.032" x2="0.637" y2="-1.27" width="0.127" layer="51"/>
<wire x1="0.637" y1="-1.27" x2="1.272" y2="-1.27" width="0.127" layer="51"/>
<wire x1="0.637" y1="-1.27" x2="-0.633" y2="-0.508" width="0.127" layer="51"/>
<wire x1="-0.347" y1="0.984" x2="0.415" y2="1.746" width="0.127" layer="51"/>
<wire x1="0.288" y1="0.603" x2="1.05" y2="1.365" width="0.127" layer="51"/>
<wire x1="0.034" y1="1.619" x2="0.288" y2="1.365" width="0.127" layer="51"/>
<wire x1="0.288" y1="1.365" x2="0.415" y2="1.746" width="0.127" layer="51"/>
<wire x1="0.415" y1="1.746" x2="0.034" y2="1.619" width="0.127" layer="51"/>
<wire x1="1.05" y1="1.365" x2="0.669" y2="1.238" width="0.127" layer="51"/>
<wire x1="0.669" y1="1.238" x2="0.923" y2="0.984" width="0.127" layer="51"/>
<wire x1="0.923" y1="0.984" x2="1.05" y2="1.365" width="0.127" layer="51"/>
<wire x1="0.796" y1="1.238" x2="0.923" y2="1.111" width="0.127" layer="51"/>
<wire x1="0.161" y1="1.619" x2="0.288" y2="1.492" width="0.127" layer="51"/>
<wire x1="0.637" y1="-2.032" x2="0.637" y2="-1.27" width="0.127" layer="51"/>
<wire x1="0.637" y1="-1.27" x2="0.637" y2="-0.508" width="0.127" layer="51"/>
<wire x1="-1.268" y1="-1.27" x2="-0.633" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-0.633" y1="-1.27" x2="-0.633" y2="-2.032" width="0.127" layer="51"/>
<wire x1="2.544" y1="-1.431" x2="2.544" y2="1.431" width="0.127" layer="21" curve="-301.284493"/>
<wire x1="2.544" y1="1.431" x2="2.544" y2="-1.431" width="0.127" layer="21"/>
<circle x="-1.272" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="1.272" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="0" y="0" radius="2.5489" width="0.127" layer="51"/>
<pad name="K" x="1.27" y="0" drill="0.8128" diameter="1.778" shape="square"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" diameter="1.778"/>
<text x="3.975" y="-2.703" size="1.27" layer="25" font="vector" rot="R90">&gt;Name</text>
<text x="5.7235" y="-2.7035" size="1.27" layer="27" font="vector" rot="R90">&gt;Value</text>
<text x="-0.477" y="-2.385" size="0.254" layer="100" font="vector">PaJa</text>
</package>
<package name="LED_5X5">
<description>&lt;B&gt;LED dioda&lt;/B&gt; - ctverec - 5mm x 5mm</description>
<wire x1="-1.27" y1="0.031" x2="-1.27" y2="-0.9515" width="0.127" layer="51"/>
<wire x1="1.27" y1="-0.9515" x2="1.27" y2="0.031" width="0.127" layer="51"/>
<wire x1="-0.635" y1="-0.1895" x2="-0.635" y2="-0.9515" width="0.127" layer="51"/>
<wire x1="-0.635" y1="-1.7135" x2="0.635" y2="-0.9515" width="0.127" layer="51"/>
<wire x1="0.635" y1="-0.9515" x2="1.27" y2="-0.9515" width="0.127" layer="51"/>
<wire x1="0.635" y1="-0.9515" x2="-0.635" y2="-0.1895" width="0.127" layer="51"/>
<wire x1="-0.349" y1="0.3485" x2="0.413" y2="1.1105" width="0.127" layer="51"/>
<wire x1="0.286" y1="-0.0325" x2="1.048" y2="0.7295" width="0.127" layer="51"/>
<wire x1="0.032" y1="0.9835" x2="0.286" y2="0.7295" width="0.127" layer="51"/>
<wire x1="0.286" y1="0.7295" x2="0.413" y2="1.1105" width="0.127" layer="51"/>
<wire x1="0.413" y1="1.1105" x2="0.032" y2="0.9835" width="0.127" layer="51"/>
<wire x1="1.048" y1="0.7295" x2="0.667" y2="0.6025" width="0.127" layer="51"/>
<wire x1="0.667" y1="0.6025" x2="0.921" y2="0.3485" width="0.127" layer="51"/>
<wire x1="0.921" y1="0.3485" x2="1.048" y2="0.7295" width="0.127" layer="51"/>
<wire x1="0.794" y1="0.6025" x2="0.921" y2="0.4755" width="0.127" layer="51"/>
<wire x1="0.159" y1="0.9835" x2="0.286" y2="0.8565" width="0.127" layer="51"/>
<wire x1="0.635" y1="-1.7135" x2="0.635" y2="-0.9515" width="0.127" layer="51"/>
<wire x1="0.635" y1="-0.9515" x2="0.635" y2="-0.1895" width="0.127" layer="51"/>
<wire x1="-1.27" y1="-0.9515" x2="-0.635" y2="-0.9515" width="0.127" layer="51"/>
<wire x1="-0.635" y1="-0.9515" x2="-0.635" y2="-1.7135" width="0.127" layer="51"/>
<wire x1="2.5399" y1="-2.54" x2="-2.54" y2="-2.54" width="0.127" layer="21"/>
<wire x1="2.5399" y1="2.54" x2="2.5399" y2="-2.54" width="0.127" layer="21"/>
<wire x1="2.5399" y1="2.54" x2="-2.54" y2="2.54" width="0.127" layer="21"/>
<wire x1="-2.54" y1="2.54" x2="-2.54" y2="-2.54" width="0.127" layer="21"/>
<circle x="-1.274" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="1.27" y="0" radius="0.477" width="0.127" layer="102"/>
<pad name="K" x="1.27" y="0" drill="0.8128" diameter="1.9304" shape="square"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" diameter="1.9304"/>
<text x="-2.228" y="1.2722" size="1.016" layer="25" font="vector">&gt;Name</text>
<text x="-2.387" y="-3.655" size="1.016" layer="27" font="vector">&gt;Value</text>
<text x="1.27" y="-2.3795" size="0.254" layer="100" font="vector">PaJa</text>
</package>
<package name="LED_8">
<description>&lt;B&gt;LED dioda&lt;/B&gt; - 8mm prumer</description>
<wire x1="-1.268" y1="-0.446" x2="-1.268" y2="-1.27" width="0.127" layer="51"/>
<wire x1="1.272" y1="-1.27" x2="1.272" y2="-0.446" width="0.127" layer="51"/>
<wire x1="-0.633" y1="-2.667" x2="0.637" y2="-1.905" width="0.127" layer="21"/>
<wire x1="0.637" y1="-1.905" x2="1.27" y2="-1.905" width="0.127" layer="21"/>
<wire x1="1.27" y1="-1.905" x2="1.27" y2="-1.27" width="0.127" layer="21"/>
<wire x1="1.27" y1="-1.27" x2="1.272" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0.637" y1="-1.905" x2="-0.633" y2="-1.143" width="0.127" layer="21"/>
<wire x1="-0.347" y1="-3.0478" x2="0.415" y2="-3.8098" width="0.127" layer="21"/>
<wire x1="0.288" y1="-2.6668" x2="1.05" y2="-3.4288" width="0.127" layer="21"/>
<wire x1="0.034" y1="-3.6828" x2="0.288" y2="-3.4288" width="0.127" layer="21"/>
<wire x1="0.288" y1="-3.4288" x2="0.415" y2="-3.8098" width="0.127" layer="21"/>
<wire x1="0.415" y1="-3.8098" x2="0.034" y2="-3.6828" width="0.127" layer="21"/>
<wire x1="1.05" y1="-3.4288" x2="0.669" y2="-3.3018" width="0.127" layer="21"/>
<wire x1="0.669" y1="-3.3018" x2="0.923" y2="-3.0478" width="0.127" layer="21"/>
<wire x1="0.923" y1="-3.0478" x2="1.05" y2="-3.4288" width="0.127" layer="21"/>
<wire x1="0.796" y1="-3.3018" x2="0.923" y2="-3.1748" width="0.127" layer="22"/>
<wire x1="0.161" y1="-3.6828" x2="0.288" y2="-3.5558" width="0.127" layer="21"/>
<wire x1="0.637" y1="-2.667" x2="0.637" y2="-1.905" width="0.127" layer="21"/>
<wire x1="0.637" y1="-1.905" x2="0.637" y2="-1.143" width="0.127" layer="21"/>
<wire x1="-1.268" y1="-1.27" x2="-1.27" y2="-1.27" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-1.27" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.905" x2="-0.633" y2="-1.905" width="0.127" layer="21"/>
<wire x1="-0.633" y1="-1.143" x2="-0.633" y2="-2.667" width="0.127" layer="21"/>
<wire x1="3.81" y1="-2.2225" x2="3.81" y2="2.2225" width="0.127" layer="21"/>
<wire x1="3.81" y1="-2.2225" x2="3.81" y2="2.2225" width="0.127" layer="21" curve="-299.487126"/>
<circle x="-1.272" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="1.272" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="0" y="0" radius="3.81" width="0.127" layer="51"/>
<pad name="K" x="1.27" y="0" drill="0.8128" diameter="1.9304" shape="square"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" diameter="1.9304"/>
<text x="-2.2268" y="1.4225" size="1.27" layer="25" font="vector">&gt;Name</text>
<text x="5.2472" y="-2.386" size="1.27" layer="27" font="vector" rot="R90">&gt;Value</text>
<text x="3.02" y="-0.477" size="0.254" layer="100" font="vector" rot="R90">PaJa</text>
</package>
<package name="LED_TROJ">
<description>&lt;B&gt;LED dioda&lt;/B&gt; - trojuhelnik</description>
<wire x1="-0.637" y1="-0.764" x2="-0.637" y2="-0.002" width="0.127" layer="21"/>
<wire x1="-1.907" y1="-0.002" x2="-2.542" y2="-0.002" width="0.127" layer="21"/>
<wire x1="-0.822" y1="1.143" x2="-0.06" y2="1.905" width="0.127" layer="21"/>
<wire x1="-0.187" y1="0.762" x2="0.575" y2="1.524" width="0.127" layer="21"/>
<wire x1="-0.441" y1="1.778" x2="-0.187" y2="1.524" width="0.127" layer="21"/>
<wire x1="-0.187" y1="1.524" x2="-0.06" y2="1.905" width="0.127" layer="21"/>
<wire x1="-0.06" y1="1.905" x2="-0.441" y2="1.778" width="0.127" layer="21"/>
<wire x1="0.575" y1="1.524" x2="0.194" y2="1.397" width="0.127" layer="21"/>
<wire x1="0.194" y1="1.397" x2="0.448" y2="1.143" width="0.127" layer="21"/>
<wire x1="0.448" y1="1.143" x2="0.575" y2="1.524" width="0.127" layer="21"/>
<wire x1="0.321" y1="1.397" x2="0.448" y2="1.27" width="0.127" layer="21"/>
<wire x1="-0.314" y1="1.778" x2="-0.187" y2="1.651" width="0.127" layer="21"/>
<wire x1="-1.907" y1="0.76" x2="-1.907" y2="-0.002" width="0.127" layer="21"/>
<wire x1="-1.907" y1="-0.002" x2="-1.907" y2="-0.764" width="0.127" layer="21"/>
<wire x1="-0.002" y1="-0.002" x2="-0.637" y2="-0.002" width="0.127" layer="21"/>
<wire x1="-0.637" y1="-0.002" x2="-0.637" y2="0.76" width="0.127" layer="21"/>
<wire x1="-1.903" y1="-0.76" x2="-0.633" y2="0.002" width="0.127" layer="21"/>
<wire x1="-0.633" y1="0.002" x2="-1.903" y2="0.764" width="0.127" layer="21"/>
<wire x1="0.9525" y1="-2.6988" x2="0.9525" y2="2.6988" width="0.127" layer="21"/>
<wire x1="0.9525" y1="2.6988" x2="-3.81" y2="0" width="0.127" layer="21"/>
<wire x1="-3.81" y1="0" x2="0.9525" y2="-2.6988" width="0.127" layer="21"/>
<circle x="0.002" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="-2.542" y="0" radius="0.477" width="0.127" layer="102"/>
<pad name="K" x="0" y="0" drill="0.8128" diameter="1.9304" shape="square" rot="R180"/>
<pad name="A" x="-2.54" y="0" drill="0.8128" diameter="1.9304" rot="R180"/>
<text x="1.2737" y="2.226" size="1.016" layer="25" font="vector" rot="R270">&gt;Name</text>
<text x="2.3868" y="2.544" size="1.016" layer="27" font="vector" rot="R270">&gt;Value</text>
<text x="0.7964" y="-1.113" size="0.254" layer="100" font="vector" rot="R180">PaJa</text>
</package>
<package name="LED2,5X5">
<description>&lt;B&gt;LED dioda&lt;/B&gt; - obdelnik - 5mm x 2,5mm</description>
<wire x1="0.639" y1="0.287" x2="0.639" y2="-0.475" width="0.127" layer="21"/>
<wire x1="0.639" y1="-1.237" x2="1.909" y2="-0.475" width="0.127" layer="21"/>
<wire x1="1.909" y1="-0.475" x2="2.544" y2="-0.475" width="0.127" layer="21"/>
<wire x1="1.909" y1="-0.475" x2="0.639" y2="0.287" width="0.127" layer="21"/>
<wire x1="1.561" y1="0.348" x2="2.323" y2="1.11" width="0.127" layer="21"/>
<wire x1="2.196" y1="-0.033" x2="2.958" y2="0.729" width="0.127" layer="21"/>
<wire x1="1.942" y1="0.983" x2="2.196" y2="0.729" width="0.127" layer="21"/>
<wire x1="2.196" y1="0.729" x2="2.323" y2="1.11" width="0.127" layer="21"/>
<wire x1="2.323" y1="1.11" x2="1.942" y2="0.983" width="0.127" layer="21"/>
<wire x1="2.958" y1="0.729" x2="2.577" y2="0.602" width="0.127" layer="21"/>
<wire x1="2.577" y1="0.602" x2="2.831" y2="0.348" width="0.127" layer="21"/>
<wire x1="2.831" y1="0.348" x2="2.958" y2="0.729" width="0.127" layer="21"/>
<wire x1="2.704" y1="0.602" x2="2.831" y2="0.475" width="0.127" layer="21"/>
<wire x1="2.069" y1="0.983" x2="2.196" y2="0.856" width="0.127" layer="21"/>
<wire x1="1.909" y1="-1.237" x2="1.909" y2="-0.475" width="0.127" layer="21"/>
<wire x1="1.909" y1="-0.475" x2="1.909" y2="0.287" width="0.127" layer="21"/>
<wire x1="0.004" y1="0.002" x2="0" y2="0.002" width="0.127" layer="21"/>
<wire x1="0" y1="0.002" x2="0" y2="-0.477" width="0.127" layer="21"/>
<wire x1="0" y1="-0.477" x2="0.639" y2="-0.475" width="0.127" layer="21"/>
<wire x1="0.639" y1="-0.475" x2="0.639" y2="-1.237" width="0.127" layer="21"/>
<wire x1="2.544" y1="-0.477" x2="2.544" y2="0" width="0.127" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-1.27" y2="1.27" width="0.127" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="3.81" y2="1.27" width="0.127" layer="21"/>
<wire x1="3.81" y1="1.27" x2="3.81" y2="-1.27" width="0.127" layer="21"/>
<wire x1="3.81" y1="-1.27" x2="-1.27" y2="-1.27" width="0.127" layer="21"/>
<circle x="0" y="0" radius="0.477" width="0.127" layer="102"/>
<circle x="2.544" y="0" radius="0.477" width="0.127" layer="102"/>
<pad name="K" x="2.54" y="0" drill="0.8128" diameter="1.9304" shape="square"/>
<pad name="A" x="0" y="0" drill="0.8128" diameter="1.9304"/>
<text x="-1.113" y="1.431" size="1.016" layer="25">&gt;Name</text>
<text x="-1.431" y="-2.385" size="1.016" layer="27">&gt;Value</text>
<text x="1.431" y="0.159" size="0.254" layer="100" rot="R90">PaJa</text>
</package>
<package name="P1206">
<wire x1="-1.7463" y1="0.7938" x2="-1.7463" y2="0.3176" width="0.127" layer="51"/>
<wire x1="0.7937" y1="-0.7937" x2="1.4287" y2="-0.7937" width="0.127" layer="51"/>
<wire x1="1.4287" y1="0.7938" x2="0.7938" y2="0.7938" width="0.127" layer="51"/>
<wire x1="0.7938" y1="0.7938" x2="0.7937" y2="0.7938" width="0.127" layer="51"/>
<wire x1="0.7937" y1="0.7938" x2="-1.1113" y2="0.7938" width="0.127" layer="21"/>
<wire x1="-1.1113" y1="0.7938" x2="-1.7463" y2="0.7938" width="0.127" layer="51"/>
<wire x1="-1.1113" y1="0.7938" x2="-1.1113" y2="-0.7937" width="0.127" layer="21"/>
<wire x1="1.4288" y1="0.3175" x2="1.4288" y2="-0.3175" width="0.127" layer="51" curve="180"/>
<wire x1="-1.7462" y1="0.3175" x2="-1.7462" y2="-0.3175" width="0.127" layer="51" curve="-180" cap="flat"/>
<wire x1="-1.7462" y1="-0.3175" x2="-1.7462" y2="-0.7938" width="0.127" layer="51"/>
<wire x1="-1.1112" y1="-0.7938" x2="-1.7462" y2="-0.7938" width="0.127" layer="51"/>
<wire x1="1.4288" y1="0.7937" x2="1.4288" y2="0.3175" width="0.127" layer="51"/>
<wire x1="1.4288" y1="-0.3175" x2="1.4288" y2="-0.7938" width="0.127" layer="51"/>
<wire x1="0.1588" y1="-0.4763" x2="0.1588" y2="0" width="0.127" layer="21"/>
<wire x1="0.1588" y1="0" x2="0.1588" y2="0.4763" width="0.127" layer="21"/>
<wire x1="0.1588" y1="0" x2="-0.4763" y2="-0.4763" width="0.127" layer="21"/>
<wire x1="-0.4763" y1="-0.4763" x2="-0.4761" y2="0" width="0.127" layer="21"/>
<wire x1="-0.4761" y1="0" x2="-0.4763" y2="0.4762" width="0.127" layer="21"/>
<wire x1="-0.4763" y1="0.4762" x2="0.1588" y2="0" width="0.127" layer="21"/>
<wire x1="0.1588" y1="0" x2="0.4763" y2="0" width="0.127" layer="21"/>
<wire x1="-0.4761" y1="0" x2="-0.7937" y2="0" width="0.127" layer="21"/>
<wire x1="-1.7463" y1="-0.3175" x2="-1.7463" y2="0.3175" width="0.127" layer="51" curve="180" cap="flat"/>
<wire x1="0.7938" y1="0.7938" x2="1.4288" y2="0.7938" width="0.127" layer="51"/>
<wire x1="1.4288" y1="-0.3175" x2="1.4288" y2="0.3175" width="0.127" layer="51" curve="-180" cap="flat"/>
<wire x1="0.7938" y1="0.7938" x2="0.7938" y2="0.3175" width="0.127" layer="51"/>
<wire x1="0.7937" y1="0.7938" x2="0.7937" y2="-0.7937" width="0.127" layer="21"/>
<wire x1="0.7937" y1="-0.7937" x2="-1.1113" y2="-0.7937" width="0.127" layer="21"/>
<circle x="1.0319" y="0.5556" radius="0.2024" width="0.127" layer="51"/>
<smd name="K" x="1.5875" y="0" dx="0.9144" dy="1.778" layer="1" rot="R180"/>
<smd name="A" x="-1.9051" y="0.0001" dx="0.9144" dy="1.778" layer="1" rot="R180"/>
<text x="-0.9922" y="0.4762" size="0.254" layer="100" font="vector" rot="R270">PaJa</text>
<text x="1.1113" y="-1.1113" size="1.016" layer="25" font="vector" rot="R180">&gt;Name</text>
<text x="1.1113" y="2.0638" size="1.016" layer="27" font="vector" rot="R180">&gt;Value</text>
<rectangle x1="-0.3174" y1="-0.1588" x2="0" y2="0.1588" layer="51" rot="R180"/>
<polygon width="0.127" layer="51">
<vertex x="-1.7463" y="-0.3175"/>
<vertex x="-1.7463" y="-0.7938"/>
<vertex x="-1.1113" y="-0.7938"/>
<vertex x="-1.1113" y="0.7938"/>
<vertex x="-1.7463" y="0.7938"/>
<vertex x="-1.7463" y="0.3175"/>
<vertex x="-1.5875" y="0.3175"/>
<vertex x="-1.4288" y="0.1588"/>
<vertex x="-1.4288" y="-0.1588"/>
<vertex x="-1.5875" y="-0.3175"/>
</polygon>
<polygon width="0.127" layer="51">
<vertex x="1.4288" y="0.7938"/>
<vertex x="1.4288" y="0.3174"/>
<vertex x="1.4288" y="0.3175"/>
<vertex x="1.27" y="0.3175"/>
<vertex x="1.1113" y="0.1588"/>
<vertex x="1.1113" y="-0.1588"/>
<vertex x="1.27" y="-0.3175"/>
<vertex x="1.4288" y="-0.3175"/>
<vertex x="1.4288" y="-0.7938"/>
<vertex x="0.7938" y="-0.7938"/>
<vertex x="0.7938" y="-0.635"/>
<vertex x="0.7937" y="-0.635"/>
<vertex x="0.7937" y="0.3175"/>
<vertex x="1.27" y="0.3175"/>
<vertex x="1.27" y="0.7938"/>
</polygon>
</package>
<package name="R-5">
<description>&lt;B&gt;Odpor&lt;/B&gt; - vel. 0204 - 0,4W - miniaturni</description>
<wire x1="-1.778" y1="0.635" x2="-1.524" y2="0.889" width="0.127" layer="21" curve="-90" cap="flat"/>
<wire x1="-1.778" y1="-0.635" x2="-1.524" y2="-0.889" width="0.127" layer="21" curve="90" cap="flat"/>
<wire x1="1.524" y1="-0.889" x2="1.778" y2="-0.635" width="0.127" layer="21" curve="90" cap="flat"/>
<wire x1="1.524" y1="0.889" x2="1.778" y2="0.6388" width="0.127" layer="21" curve="-89.149199"/>
<wire x1="1.778" y1="0.6388" x2="1.778" y2="0.635" width="0.127" layer="21" curve="-0.857165"/>
<wire x1="-1.524" y1="0.889" x2="-1.27" y2="0.889" width="0.127" layer="21"/>
<wire x1="-1.143" y1="0.762" x2="-1.27" y2="0.889" width="0.127" layer="21"/>
<wire x1="-1.524" y1="-0.889" x2="-1.27" y2="-0.889" width="0.127" layer="21"/>
<wire x1="-1.143" y1="-0.762" x2="-1.27" y2="-0.889" width="0.127" layer="21"/>
<wire x1="1.143" y1="0.762" x2="1.27" y2="0.889" width="0.127" layer="21"/>
<wire x1="1.143" y1="0.762" x2="-1.143" y2="0.762" width="0.127" layer="21"/>
<wire x1="1.143" y1="-0.762" x2="1.27" y2="-0.889" width="0.127" layer="21"/>
<wire x1="1.143" y1="-0.762" x2="-1.143" y2="-0.762" width="0.127" layer="21"/>
<wire x1="1.524" y1="0.889" x2="1.27" y2="0.889" width="0.127" layer="21"/>
<wire x1="1.524" y1="-0.889" x2="1.27" y2="-0.889" width="0.127" layer="21"/>
<wire x1="1.778" y1="0.6388" x2="1.778" y2="-0.6332" width="0.127" layer="51"/>
<wire x1="-1.7787" y1="0.6274" x2="-1.7787" y2="-0.6446" width="0.127" layer="51"/>
<circle x="-2.54" y="0" radius="0.4763" width="0.127" layer="102"/>
<circle x="2.54" y="0" radius="0.4762" width="0.127" layer="102"/>
<pad name="1" x="-2.54" y="0" drill="0.8128" diameter="1.778" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.8128" diameter="1.778" shape="octagon"/>
<text x="-1.59" y="-0.477" size="1.016" layer="25" font="vector">&gt;Name</text>
<text x="-2.544" y="-1.908" size="1.016" layer="27" font="vector">&gt;Value</text>
<text x="-0.4797" y="0.8527" size="0.254" layer="100" font="vector">PaJa</text>
<rectangle x1="-2.1022" y1="-0.306" x2="-1.8124" y2="0.3068" layer="51"/>
<rectangle x1="1.8124" y1="-0.3068" x2="2.1022" y2="0.306" layer="51"/>
</package>
<package name="R-10">
<description>&lt;B&gt;Odpor&lt;/B&gt; - vel. 0207 - 0,6W - vetsi roztec</description>
<wire x1="-2.572" y1="1.016" x2="-2.699" y2="1.143" width="0.127" layer="21"/>
<wire x1="-2.572" y1="-1.016" x2="-2.699" y2="-1.143" width="0.127" layer="21"/>
<wire x1="2.572" y1="1.016" x2="2.699" y2="1.143" width="0.127" layer="21"/>
<wire x1="2.572" y1="1.016" x2="-2.572" y2="1.016" width="0.127" layer="21"/>
<wire x1="2.572" y1="-1.016" x2="2.699" y2="-1.143" width="0.127" layer="21"/>
<wire x1="2.572" y1="-1.016" x2="-2.572" y2="-1.016" width="0.127" layer="21"/>
<wire x1="3.08" y1="1.139" x2="2.699" y2="1.139" width="0.127" layer="21"/>
<wire x1="3.08" y1="-1.147" x2="2.699" y2="-1.147" width="0.127" layer="21"/>
<wire x1="-3.334" y1="0.893" x2="-3.08" y2="1.147" width="0.127" layer="21" curve="-90" cap="flat"/>
<wire x1="-3.334" y1="-0.885" x2="-3.08" y2="-1.139" width="0.127" layer="21" curve="90" cap="flat"/>
<wire x1="-3.08" y1="-1.139" x2="-2.699" y2="-1.139" width="0.127" layer="21"/>
<wire x1="-3.08" y1="1.147" x2="-2.699" y2="1.147" width="0.127" layer="21"/>
<wire x1="-3.3321" y1="0.8823" x2="-3.3321" y2="-0.8667" width="0.127" layer="21"/>
<wire x1="3.08" y1="-1.147" x2="3.334" y2="-0.893" width="0.127" layer="21" curve="90" cap="flat"/>
<wire x1="3.08" y1="1.139" x2="3.334" y2="0.885" width="0.127" layer="21" curve="-90" cap="flat"/>
<wire x1="3.3321" y1="-0.8823" x2="3.3321" y2="0.8667" width="0.127" layer="21"/>
<circle x="-5.08" y="0" radius="0.4763" width="0.127" layer="102"/>
<circle x="5.08" y="0" radius="0.4762" width="0.127" layer="102"/>
<pad name="1" x="-5.08" y="0" drill="0.8128" diameter="1.9304" shape="octagon"/>
<pad name="2" x="5.08" y="0" drill="0.8128" diameter="1.9304" shape="octagon"/>
<text x="-3.1152" y="-0.6276" size="1.27" layer="25" font="vector">&gt;Name</text>
<text x="-0.3178" y="-0.6358" size="1.27" layer="27" font="vector">&gt;Value</text>
<text x="2.3342" y="-0.9351" size="0.254" layer="100" font="vector">PaJa</text>
<rectangle x1="-4.6038" y1="-0.3175" x2="-3.9688" y2="0.3175" layer="51"/>
<rectangle x1="3.9688" y1="-0.3175" x2="4.6038" y2="0.3175" layer="51"/>
<rectangle x1="-3.9688" y1="-0.3175" x2="-3.3338" y2="0.3175" layer="21"/>
<rectangle x1="3.3338" y1="-0.3175" x2="3.9688" y2="0.3175" layer="21"/>
</package>
<package name="R-12,7">
<description>&lt;B&gt;Odpor&lt;/B&gt; - roztec nozek 12,7mm</description>
<wire x1="3.7648" y1="1.2546" x2="3.8918" y2="1.3816" width="0.127" layer="21"/>
<wire x1="3.7648" y1="-1.2546" x2="3.8918" y2="-1.3816" width="0.127" layer="21"/>
<wire x1="4.2728" y1="1.3776" x2="3.8918" y2="1.3776" width="0.127" layer="21"/>
<wire x1="4.2728" y1="-1.3856" x2="3.8918" y2="-1.3856" width="0.127" layer="21"/>
<wire x1="4.2728" y1="-1.3856" x2="4.5268" y2="-1.1316" width="0.127" layer="21" curve="90" cap="flat"/>
<wire x1="4.2728" y1="1.3776" x2="4.5268" y2="1.1236" width="0.127" layer="21" curve="-90" cap="flat"/>
<wire x1="4.5249" y1="-1.1209" x2="4.5249" y2="1.1053" width="0.127" layer="21"/>
<wire x1="-3.7649" y1="1.2547" x2="-3.8919" y2="1.3817" width="0.127" layer="21"/>
<wire x1="-3.7649" y1="-1.2546" x2="-3.8919" y2="-1.3816" width="0.127" layer="21"/>
<wire x1="3.7648" y1="1.2546" x2="-3.7649" y2="1.2547" width="0.127" layer="21"/>
<wire x1="3.7648" y1="-1.2546" x2="-3.7649" y2="-1.2546" width="0.127" layer="21"/>
<wire x1="-4.5269" y1="1.1316" x2="-4.2729" y2="1.3856" width="0.127" layer="21" curve="-90" cap="flat"/>
<wire x1="-4.5269" y1="-1.1236" x2="-4.2729" y2="-1.3776" width="0.127" layer="21" curve="90" cap="flat"/>
<wire x1="-4.2729" y1="-1.3776" x2="-3.8919" y2="-1.3776" width="0.127" layer="21"/>
<wire x1="-4.2729" y1="1.3856" x2="-3.8919" y2="1.3856" width="0.127" layer="21"/>
<wire x1="-4.525" y1="1.1209" x2="-4.525" y2="-1.1054" width="0.127" layer="21"/>
<circle x="-6.35" y="0" radius="0.4763" width="0.127" layer="102"/>
<circle x="6.35" y="0" radius="0.4762" width="0.127" layer="102"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" diameter="2.1844" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" diameter="2.1844" shape="octagon"/>
<text x="-0.4813" y="-0.7958" size="1.4224" layer="27" font="vector">&gt;Value</text>
<text x="-4.2905" y="-0.7144" size="1.4224" layer="25" font="vector">&gt;Name</text>
<text x="3.5712" y="-1.1046" size="0.254" layer="100" font="vector">PaJa</text>
<rectangle x1="-5.08" y1="-0.3175" x2="-4.445" y2="0.3175" layer="21"/>
<rectangle x1="4.6038" y1="-0.3175" x2="5.08" y2="0.3175" layer="21"/>
<rectangle x1="4.445" y1="-0.3175" x2="5.08" y2="0.3175" layer="21"/>
<rectangle x1="-5.8738" y1="-0.3175" x2="-5.08" y2="0.3175" layer="51"/>
<rectangle x1="5.08" y1="-0.3175" x2="5.8738" y2="0.3175" layer="51"/>
</package>
<package name="R-7,5">
<description>&lt;B&gt;Odpor&lt;/B&gt; - vel. 0207 - 0,6W</description>
<wire x1="-3.175" y1="0.893" x2="-2.921" y2="1.147" width="0.127" layer="21" curve="-90" cap="flat"/>
<wire x1="-3.175" y1="-0.885" x2="-2.921" y2="-1.139" width="0.127" layer="21" curve="90" cap="flat"/>
<wire x1="2.413" y1="-1.012" x2="2.54" y2="-1.139" width="0.127" layer="21"/>
<wire x1="2.413" y1="1.02" x2="2.54" y2="1.147" width="0.127" layer="21"/>
<wire x1="-2.413" y1="-1.012" x2="-2.54" y2="-1.139" width="0.127" layer="21"/>
<wire x1="-2.413" y1="-1.012" x2="2.413" y2="-1.012" width="0.127" layer="21"/>
<wire x1="-2.413" y1="1.02" x2="-2.54" y2="1.147" width="0.127" layer="21"/>
<wire x1="-2.413" y1="1.02" x2="2.413" y2="1.02" width="0.127" layer="21"/>
<wire x1="-2.921" y1="-1.139" x2="-2.54" y2="-1.139" width="0.127" layer="21"/>
<wire x1="-2.921" y1="1.147" x2="-2.54" y2="1.147" width="0.127" layer="21"/>
<wire x1="-3.1731" y1="0.8823" x2="-3.1731" y2="-0.8667" width="0.127" layer="51"/>
<wire x1="2.921" y1="-1.147" x2="3.175" y2="-0.893" width="0.127" layer="21" curve="90" cap="flat"/>
<wire x1="2.921" y1="1.139" x2="3.175" y2="0.885" width="0.127" layer="21" curve="-90" cap="flat"/>
<wire x1="2.921" y1="1.139" x2="2.54" y2="1.139" width="0.127" layer="21"/>
<wire x1="2.921" y1="-1.147" x2="2.54" y2="-1.147" width="0.127" layer="21"/>
<wire x1="3.1731" y1="-0.8823" x2="3.1731" y2="0.8667" width="0.127" layer="51"/>
<circle x="-3.81" y="0" radius="0.4763" width="0.127" layer="102"/>
<circle x="3.81" y="0" radius="0.4762" width="0.127" layer="102"/>
<pad name="1" x="-3.81" y="0" drill="0.8128" diameter="1.9304" shape="octagon"/>
<pad name="2" x="3.81" y="0" drill="0.8128" diameter="1.9304" shape="octagon"/>
<text x="-0.3178" y="-0.477" size="1.016" layer="27" font="vector">&gt;Value</text>
<text x="-2.7033" y="-0.477" size="1.016" layer="25" font="vector">&gt;Name</text>
<text x="2.1354" y="-0.8658" size="0.254" layer="100" font="vector">PaJa</text>
<rectangle x1="-3.4323" y1="-0.3053" x2="-3.1758" y2="0.3061" layer="51"/>
<rectangle x1="3.1759" y1="-0.3061" x2="3.4324" y2="0.3053" layer="51"/>
</package>
<package name="R-_2W">
<description>&lt;B&gt;Odpor&lt;/B&gt; - 2W - vel. 0414</description>
<wire x1="4.3998" y1="1.8896" x2="4.5268" y2="2.0166" width="0.127" layer="21"/>
<wire x1="4.3998" y1="-1.8896" x2="4.5268" y2="-2.0166" width="0.127" layer="21"/>
<wire x1="4.9078" y1="2.0126" x2="4.5268" y2="2.0126" width="0.127" layer="21"/>
<wire x1="4.9078" y1="-2.0206" x2="4.5268" y2="-2.0206" width="0.127" layer="21"/>
<wire x1="4.9078" y1="-2.0206" x2="5.1618" y2="-1.7666" width="0.127" layer="21" curve="90" cap="flat"/>
<wire x1="4.9078" y1="2.0126" x2="5.1618" y2="1.7586" width="0.127" layer="21" curve="-90" cap="flat"/>
<wire x1="-4.3999" y1="1.8897" x2="-4.5269" y2="2.0167" width="0.127" layer="21"/>
<wire x1="-4.3999" y1="-1.8896" x2="-4.5269" y2="-2.0166" width="0.127" layer="21"/>
<wire x1="4.3998" y1="1.8896" x2="-4.3999" y2="1.8897" width="0.127" layer="21"/>
<wire x1="4.3998" y1="-1.8896" x2="-4.3999" y2="-1.8896" width="0.127" layer="21"/>
<wire x1="-5.1619" y1="1.7666" x2="-4.9079" y2="2.0206" width="0.127" layer="21" curve="-90" cap="flat"/>
<wire x1="-5.1619" y1="-1.7586" x2="-4.9079" y2="-2.0126" width="0.127" layer="21" curve="90" cap="flat"/>
<wire x1="-4.9079" y1="-2.0126" x2="-4.5269" y2="-2.0126" width="0.127" layer="21"/>
<wire x1="-4.9079" y1="2.0206" x2="-4.5269" y2="2.0206" width="0.127" layer="21"/>
<wire x1="-5.16" y1="1.7559" x2="-5.16" y2="0.9584" width="0.127" layer="21"/>
<wire x1="-5.16" y1="-0.9429" x2="-5.16" y2="-1.7404" width="0.127" layer="21"/>
<wire x1="5.1588" y1="-0.943" x2="5.1588" y2="-1.7405" width="0.127" layer="21"/>
<wire x1="5.1588" y1="1.7559" x2="5.1588" y2="0.9584" width="0.127" layer="21"/>
<wire x1="-5.16" y1="0.9621" x2="-5.16" y2="-0.9467" width="0.127" layer="51"/>
<wire x1="5.1588" y1="0.9621" x2="5.1588" y2="-0.9467" width="0.127" layer="51"/>
<circle x="-6.35" y="0" radius="0.4763" width="0.127" layer="102"/>
<circle x="6.35" y="0" radius="0.4762" width="0.127" layer="102"/>
<pad name="1" x="-6.35" y="0" drill="0.8128" diameter="2.54" shape="octagon"/>
<pad name="2" x="6.35" y="0" drill="0.8128" diameter="2.54" shape="octagon"/>
<text x="-0.4813" y="-0.7958" size="1.6764" layer="27" font="vector">&gt;Value</text>
<text x="-4.9255" y="-0.7144" size="1.6764" layer="25" font="vector">&gt;Name</text>
<text x="4.1268" y="-1.7396" size="0.254" layer="100" font="vector">PaJa</text>
<text x="-4.7625" y="-1.5875" size="0.6096" layer="21" font="vector">2W</text>
<rectangle x1="-5.953" y1="-0.3175" x2="-5.1593" y2="0.3175" layer="51"/>
<rectangle x1="5.1594" y1="-0.3175" x2="5.9531" y2="0.3175" layer="51"/>
</package>
<package name="R-_10W">
<description>&lt;B&gt;Odpor&lt;/B&gt; - 10W - dratovy</description>
<wire x1="-24.13" y1="5.3975" x2="-24.13" y2="-5.3975" width="0.127" layer="21"/>
<wire x1="-24.13" y1="-5.3975" x2="24.13" y2="-5.3975" width="0.127" layer="21"/>
<wire x1="24.13" y1="-5.3975" x2="24.13" y2="5.3975" width="0.127" layer="21"/>
<wire x1="24.13" y1="5.3975" x2="-24.13" y2="5.3975" width="0.127" layer="21"/>
<circle x="-25.7175" y="0" radius="0.5724" width="0.127" layer="102"/>
<circle x="25.7175" y="0" radius="0.5723" width="0.127" layer="102"/>
<pad name="1" x="-25.7175" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<pad name="2" x="25.7175" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<text x="-4.9375" y="-3.08" size="1.9304" layer="27" font="vector">&gt;VALUE</text>
<text x="-4.9375" y="1.2225" size="1.9304" layer="25" font="vector">&gt;NAME</text>
<text x="22.86" y="-5.08" size="0.254" layer="100" font="vector">PaJa</text>
<text x="-23.1775" y="-3.81" size="1.27" layer="21" font="vector">10W</text>
<rectangle x1="-25.2412" y1="-0.635" x2="-24.1299" y2="0.635" layer="51"/>
<rectangle x1="-25.5587" y1="0.4763" x2="-25.2412" y2="0.635" layer="51"/>
<rectangle x1="-25.5587" y1="-0.6349" x2="-25.2412" y2="-0.4762" layer="51"/>
<rectangle x1="24.13" y1="-0.635" x2="25.2413" y2="0.635" layer="51"/>
<rectangle x1="25.2413" y1="-0.6349" x2="25.5588" y2="-0.4762" layer="51"/>
<rectangle x1="25.2413" y1="0.4763" x2="25.5588" y2="0.635" layer="51"/>
</package>
<package name="R-_20W">
<description>&lt;B&gt;Odpor&lt;/B&gt; - 20W - dratovy</description>
<wire x1="30.1625" y1="6.985" x2="-30.1625" y2="6.985" width="0.127" layer="21"/>
<wire x1="30.1625" y1="1.1113" x2="30.1625" y2="-1.1113" width="0.127" layer="51"/>
<wire x1="-30.1626" y1="1.1113" x2="-30.1626" y2="-1.1113" width="0.127" layer="51"/>
<wire x1="-30.1625" y1="1.1113" x2="-30.1625" y2="6.985" width="0.127" layer="21"/>
<wire x1="-30.1625" y1="-1.1113" x2="-30.1625" y2="-6.985" width="0.127" layer="21"/>
<wire x1="-30.1625" y1="-6.985" x2="30.1625" y2="-6.985" width="0.127" layer="21"/>
<wire x1="30.1625" y1="-6.985" x2="30.1625" y2="-1.1113" width="0.127" layer="21"/>
<wire x1="30.1625" y1="6.985" x2="30.1625" y2="1.1113" width="0.127" layer="21"/>
<circle x="-31.75" y="0" radius="0.7099" width="0.127" layer="102"/>
<circle x="31.75" y="0" radius="0.7099" width="0.127" layer="102"/>
<pad name="1" x="-31.75" y="0" drill="1.27" diameter="3.2" shape="octagon"/>
<pad name="2" x="31.75" y="0" drill="1.27" diameter="3.2" shape="octagon"/>
<text x="-4.9375" y="-4.6675" size="2.1844" layer="27" font="vector">&gt;VALUE</text>
<text x="-4.9375" y="1.2225" size="2.1844" layer="25" font="vector">&gt;NAME</text>
<text x="28.8925" y="-6.6675" size="0.254" layer="100" font="vector">PaJa</text>
<text x="-29.21" y="-5.715" size="1.27" layer="21" font="vector">20W</text>
<rectangle x1="30.1625" y1="-0.635" x2="31.115" y2="0.635" layer="51"/>
<rectangle x1="-31.1149" y1="-0.635" x2="-30.1624" y2="0.635" layer="51"/>
<rectangle x1="-31.2738" y1="0.4763" x2="-31.115" y2="0.635" layer="51"/>
<rectangle x1="-31.2738" y1="-0.6349" x2="-31.115" y2="-0.4762" layer="51"/>
<rectangle x1="31.115" y1="-0.6349" x2="31.2738" y2="-0.4762" layer="51"/>
<rectangle x1="31.115" y1="0.4763" x2="31.2738" y2="0.635" layer="51"/>
</package>
<package name="R-_5W">
<description>&lt;B&gt;Odpor&lt;/B&gt; - 5W - keramicky</description>
<wire x1="-11.1125" y1="5.08" x2="-11.1125" y2="-5.08" width="0.127" layer="21"/>
<wire x1="-11.1125" y1="-5.08" x2="11.1125" y2="-5.08" width="0.127" layer="21"/>
<wire x1="11.1125" y1="-5.08" x2="11.1125" y2="5.08" width="0.127" layer="21"/>
<wire x1="11.1125" y1="5.08" x2="-11.1125" y2="5.08" width="0.127" layer="21"/>
<circle x="-12.7" y="0" radius="0.5724" width="0.127" layer="102"/>
<circle x="12.7" y="0" radius="0.5723" width="0.127" layer="102"/>
<pad name="1" x="-12.7" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<pad name="2" x="12.7" y="0" drill="1.016" diameter="2.54" shape="octagon"/>
<text x="-4.9375" y="-3.08" size="1.9304" layer="27" font="vector">&gt;VALUE</text>
<text x="-4.9375" y="1.2225" size="1.9304" layer="25" font="vector">&gt;NAME</text>
<text x="-10.16" y="-3.81" size="1.27" layer="21" font="vector">5W</text>
<text x="9.8425" y="-4.7625" size="0.254" layer="100" font="vector">PaJa</text>
<rectangle x1="-12.2237" y1="-0.635" x2="-11.1124" y2="0.635" layer="51"/>
<rectangle x1="-12.5412" y1="0.4763" x2="-12.2237" y2="0.635" layer="51"/>
<rectangle x1="-12.5412" y1="-0.6349" x2="-12.2237" y2="-0.4762" layer="51"/>
<rectangle x1="11.1125" y1="-0.635" x2="12.2238" y2="0.635" layer="51"/>
<rectangle x1="12.2238" y1="-0.6349" x2="12.5413" y2="-0.4762" layer="51"/>
<rectangle x1="12.2238" y1="0.4763" x2="12.5413" y2="0.635" layer="51"/>
</package>
<package name="R-STOJ">
<description>&lt;B&gt;Odpor&lt;/B&gt; - vel. 0207 - 0,6W - nastojato</description>
<wire x1="-1.905" y1="1.1113" x2="-1.905" y2="-1.1113" width="0.127" layer="21" curve="120.512458"/>
<wire x1="-0.635" y1="1.1113" x2="-0.635" y2="-1.1113" width="0.127" layer="21" curve="-120.512458"/>
<wire x1="-1.905" y1="1.1113" x2="-0.635" y2="1.1113" width="0.127" layer="51" curve="-59.487542"/>
<wire x1="-0.635" y1="-1.1113" x2="-1.905" y2="-1.1113" width="0.127" layer="51" curve="-59.487542"/>
<circle x="-1.27" y="0" radius="0.4763" width="0.127" layer="102"/>
<circle x="1.27" y="0" radius="0.4762" width="0.127" layer="102"/>
<pad name="1" x="-1.27" y="0" drill="0.8128" diameter="1.27" shape="long" rot="R90"/>
<pad name="2" x="1.27" y="0" drill="0.8128" diameter="1.27" shape="long" rot="R90"/>
<text x="-2.389" y="1.433" size="1.016" layer="25" font="vector">&gt;Name</text>
<text x="-2.544" y="-2.385" size="1.016" layer="27" font="vector">&gt;Value</text>
<text x="0.636" y="-1.272" size="0.254" layer="100" font="vector" rot="R90">PaJa</text>
<rectangle x1="-0.7938" y1="-0.3175" x2="-0.4763" y2="0.3175" layer="51"/>
<rectangle x1="0.4763" y1="-0.3175" x2="0.7938" y2="0.3175" layer="51"/>
<rectangle x1="-0.4763" y1="-0.3175" x2="0.4763" y2="0.3175" layer="21"/>
</package>
<package name="HC-49U">
<description>&lt;B&gt;Krystal&lt;/B&gt;</description>
<wire x1="-3.175" y1="2.3813" x2="3.175" y2="2.3813" width="0.127" layer="21"/>
<wire x1="-3.175" y1="-2.3812" x2="3.175" y2="-2.3812" width="0.127" layer="21"/>
<wire x1="-3.175" y1="2.3813" x2="-3.175" y2="-2.3813" width="0.127" layer="21" curve="180" cap="flat"/>
<wire x1="3.175" y1="2.3813" x2="3.175" y2="-2.3813" width="0.127" layer="21" curve="-180" cap="flat"/>
<wire x1="3.175" y1="2.0638" x2="3.175" y2="-2.0638" width="0.127" layer="51" curve="-180" cap="flat"/>
<wire x1="-3.175" y1="-2.0637" x2="-3.175" y2="2.0637" width="0.127" layer="51" curve="-180" cap="flat"/>
<wire x1="-3.175" y1="2.0638" x2="3.175" y2="2.0638" width="0.127" layer="51"/>
<wire x1="-3.175" y1="-2.0637" x2="3.175" y2="-2.0637" width="0.127" layer="51"/>
<circle x="-2.54" y="0" radius="0.3549" width="0.127" layer="102"/>
<circle x="2.54" y="0" radius="0.3549" width="0.127" layer="102"/>
<pad name="1" x="-2.54" y="0" drill="0.6096" diameter="1.9304" shape="octagon"/>
<pad name="2" x="2.54" y="0" drill="0.6096" diameter="1.9304" shape="octagon"/>
<text x="-3.0899" y="-3.8912" size="1.27" layer="27" font="vector">&gt;VALUE</text>
<text x="5.08" y="-0.4762" size="0.254" layer="100" font="vector" rot="R90">PaJa</text>
<text x="-1.27" y="-1.7462" size="0.6096" layer="101" font="vector">Krystal</text>
<text x="-1.27" y="0.4763" size="1.27" layer="25" font="vector">&gt;Name</text>
</package>
<package name="HC-49US">
<wire x1="-3.175" y1="-2.3812" x2="3.175" y2="-2.3812" width="0.127" layer="21"/>
<wire x1="3.175" y1="2.0638" x2="3.175" y2="-2.0638" width="0.127" layer="51" curve="-180" cap="flat"/>
<wire x1="-3.175" y1="-2.0637" x2="-3.175" y2="2.0637" width="0.127" layer="51" curve="-180" cap="flat"/>
<wire x1="-3.175" y1="2.0638" x2="3.175" y2="2.0638" width="0.127" layer="51"/>
<wire x1="-3.175" y1="-2.0637" x2="3.175" y2="-2.0637" width="0.127" layer="51"/>
<wire x1="-5.7149" y1="-2.3812" x2="5.715" y2="-2.3812" width="0.127" layer="21"/>
<wire x1="-5.7149" y1="2.3813" x2="-3.3338" y2="2.3813" width="0.127" layer="21"/>
<wire x1="-3.3338" y1="2.3813" x2="3.175" y2="2.3813" width="0.127" layer="21"/>
<wire x1="3.175" y1="2.3813" x2="5.715" y2="2.3813" width="0.127" layer="21"/>
<wire x1="-5.715" y1="1.1113" x2="-5.715" y2="-1.1113" width="0.127" layer="51"/>
<wire x1="5.715" y1="1.1113" x2="5.715" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-5.715" y1="2.3813" x2="-5.715" y2="1.1113" width="0.127" layer="21"/>
<wire x1="-5.715" y1="-1.1113" x2="-5.715" y2="-2.3813" width="0.127" layer="21"/>
<wire x1="5.715" y1="-2.3813" x2="5.715" y2="-1.27" width="0.127" layer="21"/>
<wire x1="5.715" y1="1.1113" x2="5.715" y2="2.3813" width="0.127" layer="21"/>
<wire x1="-5.2388" y1="1.1113" x2="-3.3338" y2="2.3813" width="0.127" layer="21" curve="-57.21954"/>
<wire x1="-5.2388" y1="-1.1113" x2="-3.175" y2="-2.3813" width="0.127" layer="21" curve="61.158233"/>
<wire x1="-5.2388" y1="1.1113" x2="-5.2388" y2="-1.1113" width="0.127" layer="51" curve="54.817804"/>
<wire x1="5.2388" y1="-1.1113" x2="3.3338" y2="-2.3813" width="0.127" layer="21" curve="-57.21954"/>
<wire x1="5.2388" y1="1.1113" x2="3.175" y2="2.3813" width="0.127" layer="21" curve="61.158233"/>
<wire x1="5.2388" y1="-1.1113" x2="5.2388" y2="1.1113" width="0.127" layer="51" curve="54.817804"/>
<smd name="1" x="-4.445" y="0" dx="3.81" dy="1.9304" layer="1"/>
<smd name="2" x="4.445" y="0" dx="3.81" dy="1.9304" layer="1"/>
<text x="-4.1274" y="1.27" size="0.254" layer="100" font="vector">PaJa</text>
<text x="1.5875" y="1.4288" size="0.6096" layer="101" font="vector">Krystal</text>
<text x="-2.0638" y="0.4763" size="1.27" layer="25" font="vector">&gt;Name</text>
<text x="-2.54" y="-1.9051" size="1.27" layer="27" font="vector">&gt;Value</text>
<rectangle x1="5.715" y1="-0.3175" x2="6.0325" y2="0.3175" layer="51"/>
<rectangle x1="-6.0326" y1="-0.3175" x2="-5.7152" y2="0.3175" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="C">
<wire x1="-2.54" y1="0" x2="-2.0638" y2="0" width="0.152" layer="94"/>
<wire x1="-0.4763" y1="0" x2="0" y2="0" width="0.152" layer="94"/>
<text x="-1.111" y="-0.479" size="0.254" layer="100" rot="R90">PaJa</text>
<text x="0.3175" y="0.635" size="1.6764" layer="95">&gt;Name</text>
<text x="0.3175" y="-0.635" size="1.6764" layer="96" rot="MR180">&gt;Value</text>
<rectangle x1="-2.2225" y1="-1.905" x2="-1.5875" y2="1.905" layer="94"/>
<rectangle x1="-0.9525" y1="-1.905" x2="-0.3175" y2="1.905" layer="94"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="LED">
<wire x1="0.95" y1="1.9085" x2="1.745" y2="2.7035" width="0.155" layer="94"/>
<wire x1="1.745" y1="2.7035" x2="1.268" y2="2.7035" width="0.155" layer="94"/>
<wire x1="1.745" y1="2.7035" x2="1.745" y2="2.2265" width="0.155" layer="94"/>
<wire x1="2.699" y1="2.2265" x2="2.222" y2="2.2265" width="0.155" layer="94"/>
<wire x1="2.699" y1="2.2265" x2="2.699" y2="1.7495" width="0.155" layer="94"/>
<wire x1="1.904" y1="1.4315" x2="2.699" y2="2.2265" width="0.155" layer="94"/>
<wire x1="2.3812" y1="1.27" x2="2.3812" y2="0" width="0.254" layer="94"/>
<wire x1="2.3812" y1="0" x2="2.3812" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0.1587" y1="-1.27" x2="0.1587" y2="1.27" width="0.254" layer="94"/>
<wire x1="0.1587" y1="1.27" x2="2.3812" y2="0" width="0.254" layer="94"/>
<wire x1="2.3812" y1="0" x2="0.1587" y2="-1.27" width="0.254" layer="94"/>
<text x="2.8575" y="-2.2224" size="1.6764" layer="96">&gt;Value</text>
<text x="0.3173" y="0.4759" size="0.254" layer="100" rot="R270">PaJa</text>
<text x="3.0163" y="0.4762" size="1.6764" layer="95">&gt;Part</text>
<pin name="A" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
<pin name="K" x="5.08" y="0" visible="off" length="short" direction="pas" rot="R180"/>
</symbol>
<symbol name="R">
<wire x1="-2.54" y1="1.0319" x2="2.54" y2="1.0319" width="0.254" layer="94"/>
<wire x1="2.54" y1="1.0319" x2="2.54" y2="-1.0319" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.0319" x2="-2.54" y2="-1.0319" width="0.254" layer="94"/>
<wire x1="-2.54" y1="-1.0319" x2="-2.54" y2="1.0319" width="0.254" layer="94"/>
<text x="2.3815" y="-0.476" size="0.254" layer="100" rot="R90">PaJa</text>
<text x="-2.2225" y="1.5875" size="1.6764" layer="95">&gt;Name</text>
<text x="-2.2225" y="-1.5875" size="1.6764" layer="96" rot="MR180">&gt;Value</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
<symbol name="XTAL">
<wire x1="-1.9051" y1="1.7463" x2="-0.635" y2="1.7463" width="0.254" layer="94"/>
<wire x1="-0.635" y1="1.7463" x2="-0.635" y2="-1.7463" width="0.254" layer="94"/>
<wire x1="-0.635" y1="-1.7463" x2="-1.9051" y2="-1.7463" width="0.254" layer="94"/>
<wire x1="-1.9051" y1="-1.7463" x2="-1.9051" y2="1.7463" width="0.254" layer="94"/>
<wire x1="-2.54" y1="1.7463" x2="-2.54" y2="-1.7463" width="0.254" layer="94"/>
<wire x1="0" y1="1.7463" x2="0" y2="-1.7463" width="0.254" layer="94"/>
<text x="-1.7092" y="-0.1591" size="0.254" layer="100">PaJa</text>
<text x="-3.8101" y="-2.2225" size="1.6764" layer="96" rot="MR180">&gt;Value</text>
<text x="-2.8575" y="2.2225" size="1.6764" layer="95">&gt;Name</text>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="2" x="2.54" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="C-KERAMIK" prefix="C" uservalue="yes">
<description>&lt;b&gt;Kondenzator - keramicky&lt;/b&gt;</description>
<gates>
<gate name="C" symbol="C" x="0" y="0" swaplevel="1"/>
</gates>
<devices>
<device name="_2,5" package="C-2,5">
<connects>
<connect gate="C" pin="1" pad="1"/>
<connect gate="C" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_5" package="C-5">
<connects>
<connect gate="C" pin="1" pad="1"/>
<connect gate="C" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_7,5" package="C-7,5">
<connects>
<connect gate="C" pin="1" pad="1"/>
<connect gate="C" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_10" package="C-10">
<connects>
<connect gate="C" pin="1" pad="1"/>
<connect gate="C" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_SMD_1206" package="1206">
<connects>
<connect gate="C" pin="1" pad="1"/>
<connect gate="C" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_SMD_0805" package="0805">
<connects>
<connect gate="C" pin="1" pad="1"/>
<connect gate="C" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="LED" prefix="D">
<description>&lt;B&gt;LED&lt;/B&gt; - jednobarevna</description>
<gates>
<gate name="D" symbol="LED" x="-2.54" y="0" swaplevel="1"/>
</gates>
<devices>
<device name="_10" package="LED_10">
<connects>
<connect gate="D" pin="A" pad="A"/>
<connect gate="D" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_3" package="LED_3">
<connects>
<connect gate="D" pin="A" pad="A"/>
<connect gate="D" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_5" package="LED_5">
<connects>
<connect gate="D" pin="A" pad="A"/>
<connect gate="D" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_5X5" package="LED_5X5">
<connects>
<connect gate="D" pin="A" pad="A"/>
<connect gate="D" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_8" package="LED_8">
<connects>
<connect gate="D" pin="A" pad="A"/>
<connect gate="D" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_TROJ" package="LED_TROJ">
<connects>
<connect gate="D" pin="A" pad="A"/>
<connect gate="D" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_2,5X5" package="LED2,5X5">
<connects>
<connect gate="D" pin="A" pad="A"/>
<connect gate="D" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_SMD_1206" package="P1206">
<connects>
<connect gate="D" pin="A" pad="A"/>
<connect gate="D" pin="K" pad="K"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="R" prefix="R" uservalue="yes">
<description>&lt;b&gt;Rezistor&lt;/b&gt;</description>
<gates>
<gate name="R" symbol="R" x="0" y="0" swaplevel="1"/>
</gates>
<devices>
<device name="_5" package="R-5">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_10" package="R-10">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_12,7" package="R-12,7">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_7,5" package="R-7,5">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_SMD_1206" package="1206">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="__2W" package="R-_2W">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="__10W" package="R-_10W">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="__20W" package="R-_20W">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="__5W" package="R-_5W">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_STOJ" package="R-STOJ">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_SMD_0805" package="0805">
<connects>
<connect gate="R" pin="1" pad="1"/>
<connect gate="R" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="Q_HC-49U" prefix="Q">
<description>&lt;B&gt;Krystal&lt;/B&gt; - 1MHz - 48MHz</description>
<gates>
<gate name="Q" symbol="XTAL" x="-40.64" y="33.02" swaplevel="2"/>
</gates>
<devices>
<device name="" package="HC-49U">
<connects>
<connect gate="Q" pin="1" pad="1"/>
<connect gate="Q" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_SMD" package="HC-49US">
<connects>
<connect gate="Q" pin="1" pad="1"/>
<connect gate="Q" pin="2" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ondrap">
<packages>
<package name="SOT23">
<description>&lt;b&gt;SOT-23&lt;/b&gt;</description>
<wire x1="1.4224" y1="0.6604" x2="1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="1.4224" y1="-0.6604" x2="-1.4224" y2="-0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="-0.6604" x2="-1.4224" y2="0.6604" width="0.1524" layer="51"/>
<wire x1="-1.4224" y1="0.6604" x2="1.4224" y2="0.6604" width="0.1524" layer="51"/>
<smd name="3" x="0" y="1.1" dx="1" dy="1.4" layer="1"/>
<smd name="2" x="0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<smd name="1" x="-0.95" y="-1.1" dx="1" dy="1.4" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.2286" y1="0.7112" x2="0.2286" y2="1.2954" layer="51"/>
<rectangle x1="0.7112" y1="-1.2954" x2="1.1684" y2="-0.7112" layer="51"/>
<rectangle x1="-1.1684" y1="-1.2954" x2="-0.7112" y2="-0.7112" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="N-MOSFET">
<wire x1="-1.1176" y1="2.413" x2="-1.1176" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-1.1176" y1="-2.54" x2="-5.08" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="2.54" y1="1.905" x2="0.5334" y2="1.905" width="0.1524" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="1.905" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="0.508" y1="-1.905" x2="2.54" y2="-1.905" width="0.1524" layer="94"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="0.508" y1="0" x2="1.778" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="1.778" y1="-0.508" x2="1.778" y2="0.508" width="0.1524" layer="94"/>
<wire x1="1.778" y1="0.508" x2="0.508" y2="0" width="0.1524" layer="94"/>
<wire x1="1.651" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="1.651" y1="0.254" x2="0.762" y2="0" width="0.3048" layer="94"/>
<wire x1="0.762" y1="0" x2="1.651" y2="-0.254" width="0.3048" layer="94"/>
<wire x1="1.651" y1="-0.254" x2="1.651" y2="0" width="0.3048" layer="94"/>
<wire x1="1.651" y1="0" x2="1.397" y2="0" width="0.3048" layer="94"/>
<circle x="0.3175" y="0" radius="3.5921" width="0.254" layer="94"/>
<circle x="2.54" y="-1.905" radius="0.127" width="0.4064" layer="94"/>
<text x="3.4925" y="2.54" size="1.9304" layer="95">&gt;Name</text>
<text x="3.4925" y="-4.445" size="1.9304" layer="96">&gt;Value</text>
<text x="1.431" y="-1.429" size="0.254" layer="100" rot="R180">PaJa</text>
<text x="0.635" y="2.2225" size="0.8128" layer="101">D</text>
<text x="0.635" y="-3.175" size="0.8128" layer="101">S</text>
<text x="-2.54" y="-1.905" size="0.8128" layer="101">G</text>
<rectangle x1="-0.254" y1="-2.54" x2="0.508" y2="-1.27" layer="94"/>
<rectangle x1="-0.254" y1="1.27" x2="0.508" y2="2.54" layer="94"/>
<rectangle x1="-0.254" y1="-0.889" x2="0.508" y2="0.889" layer="94"/>
<pin name="G" x="-5.08" y="-2.54" visible="off" length="point" direction="pas"/>
<pin name="D" x="2.54" y="5.08" visible="off" length="short" direction="pas" rot="R270"/>
<pin name="S" x="2.54" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="BUZ11" prefix="T">
<description>&lt;b&gt;N-Channel Enhancement MOSFET&lt;/b&gt;</description>
<gates>
<gate name="T" symbol="N-MOSFET" x="0" y="0" swaplevel="1"/>
</gates>
<devices>
<device name="" package="SOT23">
<connects>
<connect gate="T" pin="D" pad="3"/>
<connect gate="T" pin="G" pad="1"/>
<connect gate="T" pin="S" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="IC1" library="atmega8" deviceset="ATMEGA48/88/168" device="-AU"/>
<part name="P+1" library="supply1" deviceset="VCC" device=""/>
<part name="GND1" library="supply1" deviceset="GND" device=""/>
<part name="K1" library="#PaJa_konektory" deviceset="PSH02-04" device="W"/>
<part name="K2" library="#PaJa_konektory" deviceset="PSH02-04" device="W"/>
<part name="GND2" library="supply1" deviceset="GND" device=""/>
<part name="GND3" library="supply1" deviceset="GND" device=""/>
<part name="P+2" library="supply1" deviceset="VCC" device=""/>
<part name="P+3" library="supply1" deviceset="VCC" device=""/>
<part name="C1" library="#PaJa_30" deviceset="C-KERAMIK" device="_SMD_1206"/>
<part name="C2" library="#PaJa_30" deviceset="C-KERAMIK" device="_SMD_1206" value="15pf"/>
<part name="C3" library="#PaJa_30" deviceset="C-KERAMIK" device="_SMD_1206" value="15p"/>
<part name="GND4" library="supply1" deviceset="GND" device=""/>
<part name="CON1" library="#PaJa_konektory" deviceset="MLW06" device="_90°"/>
<part name="P+4" library="supply1" deviceset="VCC" device=""/>
<part name="GND5" library="supply1" deviceset="GND" device=""/>
<part name="D1" library="#PaJa_30" deviceset="LED" device="_SMD_1206"/>
<part name="D2" library="#PaJa_30" deviceset="LED" device="_SMD_1206"/>
<part name="D3" library="#PaJa_30" deviceset="LED" device="_SMD_1206"/>
<part name="D4" library="#PaJa_30" deviceset="LED" device="_SMD_1206"/>
<part name="D5" library="#PaJa_30" deviceset="LED" device="_SMD_1206"/>
<part name="D6" library="#PaJa_30" deviceset="LED" device="_SMD_1206"/>
<part name="R1" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="150"/>
<part name="R2" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="150"/>
<part name="R3" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="150"/>
<part name="R4" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="150"/>
<part name="R5" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="150"/>
<part name="R6" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="150"/>
<part name="GND6" library="supply1" deviceset="GND" device=""/>
<part name="Q2" library="#PaJa_30" deviceset="Q_HC-49U" device="_SMD"/>
<part name="T1" library="ondrap" deviceset="BUZ11" device=""/>
<part name="T2" library="ondrap" deviceset="BUZ11" device=""/>
<part name="K4" library="#PaJa_konektory" deviceset="PSH02-04" device="W"/>
<part name="P+6" library="supply1" deviceset="VCC" device=""/>
<part name="R7" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="4.7k"/>
<part name="R8" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="4.7k"/>
<part name="P+7" library="supply1" deviceset="VCC" device=""/>
<part name="R9" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="3.3k"/>
<part name="R10" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="3.3k"/>
<part name="K5" library="#PaJa_konektory" deviceset="PSH02-04" device="W"/>
<part name="R11" library="#PaJa_30" deviceset="R" device="_SMD_1206" value="10k"/>
<part name="P+8" library="supply1" deviceset="VCC" device=""/>
<part name="P+9" library="supply1" deviceset="VCC" device=""/>
<part name="GND8" library="supply1" deviceset="GND" device=""/>
<part name="GND9" library="supply1" deviceset="GND" device=""/>
<part name="C4" library="#PaJa_30" deviceset="C-KERAMIK" device="_SMD_1206"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="IC1" gate="1" x="93.98" y="66.04"/>
<instance part="P+1" gate="VCC" x="40.64" y="66.04" rot="R90"/>
<instance part="GND1" gate="1" x="40.64" y="35.56" rot="R270"/>
<instance part="K1" gate="KON" x="134.62" y="104.14"/>
<instance part="K2" gate="KON" x="139.7" y="76.2"/>
<instance part="GND2" gate="1" x="147.32" y="96.52" rot="R90"/>
<instance part="GND3" gate="1" x="154.94" y="71.12" rot="R90"/>
<instance part="P+2" gate="VCC" x="147.32" y="68.58" rot="R270"/>
<instance part="P+3" gate="VCC" x="147.32" y="91.44" rot="R270"/>
<instance part="C1" gate="C" x="48.26" y="53.34" rot="R90"/>
<instance part="C2" gate="C" x="50.8" y="83.82"/>
<instance part="C3" gate="C" x="50.8" y="71.12"/>
<instance part="GND4" gate="1" x="38.1" y="76.2" rot="R270"/>
<instance part="CON1" gate="C" x="144.78" y="33.02" rot="R180"/>
<instance part="P+4" gate="VCC" x="165.1" y="35.56" rot="R270"/>
<instance part="GND5" gate="1" x="165.1" y="30.48" rot="R90"/>
<instance part="D1" gate="D" x="170.18" y="76.2" rot="R90"/>
<instance part="D2" gate="D" x="177.8" y="76.2" rot="R90"/>
<instance part="D3" gate="D" x="185.42" y="76.2" rot="R90"/>
<instance part="D4" gate="D" x="193.04" y="76.2" rot="R90"/>
<instance part="D5" gate="D" x="200.66" y="76.2" rot="R90"/>
<instance part="D6" gate="D" x="208.28" y="76.2" rot="R90"/>
<instance part="R1" gate="R" x="170.18" y="66.04" rot="R90"/>
<instance part="R2" gate="R" x="177.8" y="66.04" rot="R90"/>
<instance part="R3" gate="R" x="185.42" y="66.04" rot="R90"/>
<instance part="R4" gate="R" x="193.04" y="66.04" rot="R90"/>
<instance part="R5" gate="R" x="200.66" y="66.04" rot="R90"/>
<instance part="R6" gate="R" x="208.28" y="66.04" rot="R90"/>
<instance part="GND6" gate="1" x="218.44" y="91.44" rot="R90"/>
<instance part="Q2" gate="Q" x="55.88" y="76.2" rot="R270"/>
<instance part="T1" gate="T" x="180.34" y="106.68" rot="MR270"/>
<instance part="T2" gate="T" x="180.34" y="129.54" rot="MR270"/>
<instance part="K4" gate="KON" x="208.28" y="152.4" rot="MR0"/>
<instance part="P+6" gate="VCC" x="172.72" y="121.92"/>
<instance part="R7" gate="R" x="172.72" y="111.76" rot="R270"/>
<instance part="R8" gate="R" x="172.72" y="134.62" rot="R90"/>
<instance part="P+7" gate="VCC" x="172.72" y="144.78"/>
<instance part="R9" gate="R" x="200.66" y="116.84" rot="R180"/>
<instance part="R10" gate="R" x="200.66" y="134.62" rot="R270"/>
<instance part="K5" gate="KON" x="162.56" y="134.62" rot="MR0"/>
<instance part="R11" gate="R" x="48.26" y="101.6"/>
<instance part="P+8" gate="VCC" x="60.96" y="101.6" rot="R270"/>
<instance part="P+9" gate="VCC" x="152.4" y="121.92" rot="R90"/>
<instance part="GND8" gate="1" x="147.32" y="127" rot="R270"/>
<instance part="GND9" gate="1" x="195.58" y="147.32" rot="R270"/>
<instance part="C4" gate="C" x="55.88" y="53.34" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="VCC" class="0">
<segment>
<pinref part="IC1" gate="1" pin="VCC@1"/>
<pinref part="P+1" gate="VCC" pin="VCC"/>
<pinref part="C1" gate="C" pin="2"/>
<wire x1="63.5" y1="66.04" x2="60.96" y2="66.04" width="0.1524" layer="91"/>
<wire x1="60.96" y1="66.04" x2="55.88" y2="66.04" width="0.1524" layer="91"/>
<wire x1="55.88" y1="66.04" x2="48.26" y2="66.04" width="0.1524" layer="91"/>
<wire x1="48.26" y1="66.04" x2="43.18" y2="66.04" width="0.1524" layer="91"/>
<wire x1="48.26" y1="66.04" x2="48.26" y2="55.88" width="0.1524" layer="91"/>
<junction x="48.26" y="66.04"/>
<pinref part="IC1" gate="1" pin="VCC@2"/>
<wire x1="60.96" y1="63.5" x2="63.5" y2="63.5" width="0.1524" layer="91"/>
<wire x1="60.96" y1="63.5" x2="60.96" y2="66.04" width="0.1524" layer="91"/>
<junction x="60.96" y="66.04"/>
<pinref part="IC1" gate="1" pin="AVCC"/>
<wire x1="63.5" y1="58.42" x2="55.88" y2="58.42" width="0.1524" layer="91"/>
<wire x1="55.88" y1="58.42" x2="55.88" y2="66.04" width="0.1524" layer="91"/>
<junction x="55.88" y="66.04"/>
<pinref part="C4" gate="C" pin="2"/>
<wire x1="55.88" y1="55.88" x2="55.88" y2="58.42" width="0.1524" layer="91"/>
<junction x="55.88" y="58.42"/>
</segment>
<segment>
<pinref part="K1" gate="KON" pin="3"/>
<pinref part="P+3" gate="VCC" pin="VCC"/>
<wire x1="137.16" y1="101.6" x2="137.16" y2="91.44" width="0.1524" layer="91"/>
<wire x1="137.16" y1="91.44" x2="144.78" y2="91.44" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="K2" gate="KON" pin="3"/>
<pinref part="P+2" gate="VCC" pin="VCC"/>
<wire x1="142.24" y1="73.66" x2="142.24" y2="68.58" width="0.1524" layer="91"/>
<wire x1="142.24" y1="68.58" x2="144.78" y2="68.58" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="CON1" gate="C" pin="2"/>
<wire x1="152.4" y1="35.56" x2="162.56" y2="35.56" width="0.1524" layer="91"/>
<pinref part="P+4" gate="VCC" pin="VCC"/>
</segment>
<segment>
<pinref part="R7" gate="R" pin="1"/>
<pinref part="P+6" gate="VCC" pin="VCC"/>
<wire x1="172.72" y1="119.38" x2="172.72" y2="116.84" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="R8" gate="R" pin="2"/>
<pinref part="P+7" gate="VCC" pin="VCC"/>
<wire x1="172.72" y1="139.7" x2="172.72" y2="142.24" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="P+8" gate="VCC" pin="VCC"/>
<pinref part="R11" gate="R" pin="2"/>
<wire x1="58.42" y1="101.6" x2="53.34" y2="101.6" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="K5" gate="KON" pin="3"/>
<pinref part="P+9" gate="VCC" pin="VCC"/>
<wire x1="160.02" y1="132.08" x2="160.02" y2="121.92" width="0.1524" layer="91"/>
<wire x1="160.02" y1="121.92" x2="154.94" y2="121.92" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="GND1" gate="1" pin="GND"/>
<pinref part="C1" gate="C" pin="1"/>
<wire x1="48.26" y1="35.56" x2="43.18" y2="35.56" width="0.1524" layer="91"/>
<wire x1="48.26" y1="48.26" x2="48.26" y2="35.56" width="0.1524" layer="91"/>
<pinref part="IC1" gate="1" pin="GND@2"/>
<wire x1="63.5" y1="35.56" x2="60.96" y2="35.56" width="0.1524" layer="91"/>
<junction x="48.26" y="35.56"/>
<pinref part="IC1" gate="1" pin="GND@1"/>
<wire x1="60.96" y1="35.56" x2="55.88" y2="35.56" width="0.1524" layer="91"/>
<wire x1="55.88" y1="35.56" x2="48.26" y2="35.56" width="0.1524" layer="91"/>
<wire x1="63.5" y1="38.1" x2="60.96" y2="38.1" width="0.1524" layer="91"/>
<wire x1="60.96" y1="38.1" x2="60.96" y2="35.56" width="0.1524" layer="91"/>
<junction x="60.96" y="35.56"/>
<pinref part="IC1" gate="1" pin="AGND"/>
<wire x1="63.5" y1="43.18" x2="60.96" y2="43.18" width="0.1524" layer="91"/>
<wire x1="60.96" y1="43.18" x2="60.96" y2="38.1" width="0.1524" layer="91"/>
<junction x="60.96" y="38.1"/>
<pinref part="C4" gate="C" pin="1"/>
<wire x1="55.88" y1="48.26" x2="55.88" y2="35.56" width="0.1524" layer="91"/>
<junction x="55.88" y="35.56"/>
</segment>
<segment>
<pinref part="K1" gate="KON" pin="4"/>
<wire x1="139.7" y1="101.6" x2="139.7" y2="96.52" width="0.1524" layer="91"/>
<wire x1="139.7" y1="96.52" x2="144.78" y2="96.52" width="0.1524" layer="91"/>
<pinref part="GND2" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="K2" gate="KON" pin="4"/>
<wire x1="144.78" y1="73.66" x2="144.78" y2="71.12" width="0.1524" layer="91"/>
<wire x1="144.78" y1="71.12" x2="152.4" y2="71.12" width="0.1524" layer="91"/>
<pinref part="GND3" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="C2" gate="C" pin="1"/>
<wire x1="45.72" y1="83.82" x2="43.18" y2="83.82" width="0.1524" layer="91"/>
<wire x1="43.18" y1="83.82" x2="43.18" y2="76.2" width="0.1524" layer="91"/>
<pinref part="C3" gate="C" pin="1"/>
<wire x1="43.18" y1="76.2" x2="43.18" y2="71.12" width="0.1524" layer="91"/>
<wire x1="43.18" y1="71.12" x2="45.72" y2="71.12" width="0.1524" layer="91"/>
<pinref part="GND4" gate="1" pin="GND"/>
<wire x1="43.18" y1="76.2" x2="40.64" y2="76.2" width="0.1524" layer="91"/>
<junction x="43.18" y="76.2"/>
</segment>
<segment>
<pinref part="CON1" gate="C" pin="6"/>
<wire x1="152.4" y1="30.48" x2="162.56" y2="30.48" width="0.1524" layer="91"/>
<pinref part="GND5" gate="1" pin="GND"/>
</segment>
<segment>
<wire x1="170.18" y1="91.44" x2="177.8" y2="91.44" width="0.1524" layer="91"/>
<pinref part="GND6" gate="1" pin="GND"/>
<wire x1="177.8" y1="91.44" x2="185.42" y2="91.44" width="0.1524" layer="91"/>
<wire x1="185.42" y1="91.44" x2="193.04" y2="91.44" width="0.1524" layer="91"/>
<wire x1="193.04" y1="91.44" x2="200.66" y2="91.44" width="0.1524" layer="91"/>
<wire x1="200.66" y1="91.44" x2="208.28" y2="91.44" width="0.1524" layer="91"/>
<wire x1="208.28" y1="91.44" x2="215.9" y2="91.44" width="0.1524" layer="91"/>
<wire x1="170.18" y1="91.44" x2="170.18" y2="81.28" width="0.1524" layer="91"/>
<pinref part="D1" gate="D" pin="K"/>
<pinref part="D2" gate="D" pin="K"/>
<wire x1="177.8" y1="91.44" x2="177.8" y2="81.28" width="0.1524" layer="91"/>
<junction x="177.8" y="91.44"/>
<pinref part="D3" gate="D" pin="K"/>
<wire x1="185.42" y1="81.28" x2="185.42" y2="91.44" width="0.1524" layer="91"/>
<junction x="185.42" y="91.44"/>
<pinref part="D4" gate="D" pin="K"/>
<wire x1="193.04" y1="81.28" x2="193.04" y2="91.44" width="0.1524" layer="91"/>
<junction x="193.04" y="91.44"/>
<pinref part="D5" gate="D" pin="K"/>
<wire x1="200.66" y1="81.28" x2="200.66" y2="91.44" width="0.1524" layer="91"/>
<junction x="200.66" y="91.44"/>
<pinref part="D6" gate="D" pin="K"/>
<wire x1="208.28" y1="81.28" x2="208.28" y2="91.44" width="0.1524" layer="91"/>
<junction x="208.28" y="91.44"/>
</segment>
<segment>
<pinref part="GND9" gate="1" pin="GND"/>
<wire x1="198.12" y1="147.32" x2="203.2" y2="147.32" width="0.1524" layer="91"/>
<pinref part="K4" gate="KON" pin="4"/>
<wire x1="203.2" y1="147.32" x2="203.2" y2="149.86" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="K5" gate="KON" pin="4"/>
<pinref part="GND8" gate="1" pin="GND"/>
<wire x1="157.48" y1="132.08" x2="157.48" y2="127" width="0.1524" layer="91"/>
<wire x1="157.48" y1="127" x2="149.86" y2="127" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PC0(ADC0/PCINT8)"/>
<pinref part="K1" gate="KON" pin="2"/>
<wire x1="124.46" y1="93.98" x2="134.62" y2="93.98" width="0.1524" layer="91"/>
<wire x1="134.62" y1="93.98" x2="134.62" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="K1" gate="KON" pin="1"/>
<pinref part="IC1" gate="1" pin="PC1(ADC1/PCINT9)"/>
<wire x1="132.08" y1="101.6" x2="132.08" y2="91.44" width="0.1524" layer="91"/>
<wire x1="132.08" y1="91.44" x2="124.46" y2="91.44" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="K2" gate="KON" pin="2"/>
<pinref part="IC1" gate="1" pin="PD0(RXD/PCINT16)"/>
<wire x1="139.7" y1="73.66" x2="139.7" y2="71.12" width="0.1524" layer="91"/>
<wire x1="139.7" y1="71.12" x2="124.46" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PD1(TXD/PCINT17)"/>
<wire x1="137.16" y1="68.58" x2="124.46" y2="68.58" width="0.1524" layer="91"/>
<pinref part="K2" gate="KON" pin="1"/>
<wire x1="137.16" y1="73.66" x2="137.16" y2="68.58" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PB4(MISO/PCINT4)"/>
<wire x1="124.46" y1="38.1" x2="132.08" y2="38.1" width="0.1524" layer="91"/>
<wire x1="132.08" y1="38.1" x2="132.08" y2="35.56" width="0.1524" layer="91"/>
<wire x1="132.08" y1="35.56" x2="137.16" y2="35.56" width="0.1524" layer="91"/>
<pinref part="CON1" gate="C" pin="1"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PB5(SCK/PCINT5)"/>
<pinref part="CON1" gate="C" pin="3"/>
<wire x1="124.46" y1="35.56" x2="129.54" y2="35.56" width="0.1524" layer="91"/>
<wire x1="129.54" y1="35.56" x2="129.54" y2="33.02" width="0.1524" layer="91"/>
<wire x1="129.54" y1="33.02" x2="137.16" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PB3(MOSI/OC2A/PCINT3)"/>
<wire x1="124.46" y1="40.64" x2="157.48" y2="40.64" width="0.1524" layer="91"/>
<wire x1="157.48" y1="40.64" x2="157.48" y2="33.02" width="0.1524" layer="91"/>
<pinref part="CON1" gate="C" pin="4"/>
<wire x1="157.48" y1="33.02" x2="152.4" y2="33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="RST" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PC6(/RESET/PCINT14)"/>
<wire x1="63.5" y1="93.98" x2="38.1" y2="93.98" width="0.1524" layer="91"/>
<wire x1="38.1" y1="93.98" x2="30.48" y2="93.98" width="0.1524" layer="91"/>
<wire x1="30.48" y1="93.98" x2="30.48" y2="30.48" width="0.1524" layer="91"/>
<pinref part="CON1" gate="C" pin="5"/>
<wire x1="30.48" y1="30.48" x2="137.16" y2="30.48" width="0.1524" layer="91"/>
<wire x1="38.1" y1="93.98" x2="38.1" y2="101.6" width="0.1524" layer="91"/>
<junction x="38.1" y="93.98"/>
<pinref part="R11" gate="R" pin="1"/>
<wire x1="38.1" y1="101.6" x2="43.18" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PD5(T1/OC0B/PCINT21)"/>
<wire x1="124.46" y1="58.42" x2="170.18" y2="58.42" width="0.1524" layer="91"/>
<pinref part="R1" gate="R" pin="1"/>
<wire x1="170.18" y1="58.42" x2="170.18" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PD6(AIN0/OC0A/PCINT22)"/>
<wire x1="124.46" y1="55.88" x2="177.8" y2="55.88" width="0.1524" layer="91"/>
<pinref part="R2" gate="R" pin="1"/>
<wire x1="177.8" y1="55.88" x2="177.8" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PD7(AIN1/PCINT23)"/>
<wire x1="124.46" y1="53.34" x2="185.42" y2="53.34" width="0.1524" layer="91"/>
<pinref part="R3" gate="R" pin="1"/>
<wire x1="185.42" y1="53.34" x2="185.42" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PB0(ICP1/CLKO/PCINT0)"/>
<wire x1="124.46" y1="48.26" x2="193.04" y2="48.26" width="0.1524" layer="91"/>
<pinref part="R4" gate="R" pin="1"/>
<wire x1="193.04" y1="48.26" x2="193.04" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PB1(OC1A/PCINT1)"/>
<wire x1="124.46" y1="45.72" x2="200.66" y2="45.72" width="0.1524" layer="91"/>
<pinref part="R5" gate="R" pin="1"/>
<wire x1="200.66" y1="45.72" x2="200.66" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PB2(SS/OC1B/PCINT2)"/>
<wire x1="124.46" y1="43.18" x2="208.28" y2="43.18" width="0.1524" layer="91"/>
<pinref part="R6" gate="R" pin="1"/>
<wire x1="208.28" y1="43.18" x2="208.28" y2="60.96" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$22" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PB6(XTAL1/TOSC1/PCINT6)"/>
<wire x1="63.5" y1="78.74" x2="60.96" y2="78.74" width="0.1524" layer="91"/>
<pinref part="C2" gate="C" pin="2"/>
<wire x1="53.34" y1="83.82" x2="55.88" y2="83.82" width="0.1524" layer="91"/>
<wire x1="55.88" y1="83.82" x2="60.96" y2="83.82" width="0.1524" layer="91"/>
<wire x1="60.96" y1="83.82" x2="60.96" y2="78.74" width="0.1524" layer="91"/>
<pinref part="Q2" gate="Q" pin="1"/>
<wire x1="55.88" y1="83.82" x2="55.88" y2="81.28" width="0.1524" layer="91"/>
<junction x="55.88" y="83.82"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="Q2" gate="Q" pin="2"/>
<wire x1="55.88" y1="73.66" x2="55.88" y2="71.12" width="0.1524" layer="91"/>
<pinref part="C3" gate="C" pin="2"/>
<wire x1="55.88" y1="71.12" x2="53.34" y2="71.12" width="0.1524" layer="91"/>
<wire x1="55.88" y1="71.12" x2="60.96" y2="71.12" width="0.1524" layer="91"/>
<wire x1="60.96" y1="71.12" x2="60.96" y2="73.66" width="0.1524" layer="91"/>
<junction x="55.88" y="71.12"/>
<pinref part="IC1" gate="1" pin="PB7(XTAL2/TOSC2/PCINT7)"/>
<wire x1="60.96" y1="73.66" x2="63.5" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SCL5" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PC5(ADC5/SCL/PCINT13)"/>
<wire x1="124.46" y1="81.28" x2="129.54" y2="81.28" width="0.1524" layer="91"/>
<wire x1="129.54" y1="81.28" x2="129.54" y2="86.36" width="0.1524" layer="91"/>
<wire x1="129.54" y1="86.36" x2="165.1" y2="86.36" width="0.1524" layer="91"/>
<wire x1="165.1" y1="86.36" x2="165.1" y2="104.14" width="0.1524" layer="91"/>
<pinref part="T1" gate="T" pin="D"/>
<wire x1="165.1" y1="104.14" x2="172.72" y2="104.14" width="0.1524" layer="91"/>
<pinref part="R7" gate="R" pin="2"/>
<wire x1="172.72" y1="104.14" x2="175.26" y2="104.14" width="0.1524" layer="91"/>
<wire x1="172.72" y1="106.68" x2="172.72" y2="104.14" width="0.1524" layer="91"/>
<junction x="172.72" y="104.14"/>
<pinref part="K5" gate="KON" pin="1"/>
<wire x1="165.1" y1="132.08" x2="165.1" y2="104.14" width="0.1524" layer="91"/>
<junction x="165.1" y="104.14"/>
</segment>
</net>
<net name="SDA5" class="0">
<segment>
<pinref part="IC1" gate="1" pin="PC4(ADC4/SDA/PCINT12)"/>
<wire x1="124.46" y1="83.82" x2="127" y2="83.82" width="0.1524" layer="91"/>
<wire x1="127" y1="83.82" x2="127" y2="88.9" width="0.1524" layer="91"/>
<wire x1="127" y1="88.9" x2="162.56" y2="88.9" width="0.1524" layer="91"/>
<wire x1="162.56" y1="88.9" x2="162.56" y2="127" width="0.1524" layer="91"/>
<pinref part="T2" gate="T" pin="D"/>
<wire x1="162.56" y1="127" x2="172.72" y2="127" width="0.1524" layer="91"/>
<pinref part="R8" gate="R" pin="1"/>
<wire x1="172.72" y1="127" x2="175.26" y2="127" width="0.1524" layer="91"/>
<wire x1="172.72" y1="127" x2="172.72" y2="129.54" width="0.1524" layer="91"/>
<junction x="172.72" y="127"/>
<pinref part="K5" gate="KON" pin="2"/>
<wire x1="162.56" y1="132.08" x2="162.56" y2="127" width="0.1524" layer="91"/>
<junction x="162.56" y="127"/>
</segment>
</net>
<net name="N$24" class="0">
<segment>
<pinref part="T2" gate="T" pin="G"/>
<wire x1="182.88" y1="134.62" x2="182.88" y2="142.24" width="0.1524" layer="91"/>
<wire x1="182.88" y1="142.24" x2="190.5" y2="142.24" width="0.1524" layer="91"/>
<wire x1="190.5" y1="142.24" x2="200.66" y2="142.24" width="0.1524" layer="91"/>
<pinref part="T1" gate="T" pin="G"/>
<wire x1="182.88" y1="111.76" x2="182.88" y2="116.84" width="0.1524" layer="91"/>
<wire x1="182.88" y1="116.84" x2="190.5" y2="116.84" width="0.1524" layer="91"/>
<wire x1="190.5" y1="116.84" x2="190.5" y2="142.24" width="0.1524" layer="91"/>
<junction x="190.5" y="142.24"/>
<pinref part="R10" gate="R" pin="1"/>
<wire x1="200.66" y1="139.7" x2="200.66" y2="142.24" width="0.1524" layer="91"/>
<pinref part="R9" gate="R" pin="2"/>
<wire x1="190.5" y1="116.84" x2="195.58" y2="116.84" width="0.1524" layer="91"/>
<junction x="190.5" y="116.84"/>
<pinref part="K4" gate="KON" pin="3"/>
<wire x1="205.74" y1="149.86" x2="205.74" y2="142.24" width="0.1524" layer="91"/>
<wire x1="205.74" y1="142.24" x2="200.66" y2="142.24" width="0.1524" layer="91"/>
<junction x="200.66" y="142.24"/>
</segment>
</net>
<net name="SDA3" class="0">
<segment>
<pinref part="T2" gate="T" pin="S"/>
<wire x1="185.42" y1="127" x2="200.66" y2="127" width="0.1524" layer="91"/>
<pinref part="R10" gate="R" pin="2"/>
<wire x1="200.66" y1="127" x2="208.28" y2="127" width="0.1524" layer="91"/>
<wire x1="200.66" y1="129.54" x2="200.66" y2="127" width="0.1524" layer="91"/>
<junction x="200.66" y="127"/>
<pinref part="K4" gate="KON" pin="2"/>
<wire x1="208.28" y1="127" x2="208.28" y2="149.86" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SCL3" class="0">
<segment>
<pinref part="T1" gate="T" pin="S"/>
<wire x1="185.42" y1="104.14" x2="210.82" y2="104.14" width="0.1524" layer="91"/>
<wire x1="210.82" y1="104.14" x2="210.82" y2="116.84" width="0.1524" layer="91"/>
<pinref part="R9" gate="R" pin="1"/>
<wire x1="205.74" y1="116.84" x2="210.82" y2="116.84" width="0.1524" layer="91"/>
<pinref part="K4" gate="KON" pin="1"/>
<wire x1="210.82" y1="116.84" x2="210.82" y2="149.86" width="0.1524" layer="91"/>
<junction x="210.82" y="116.84"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="D1" gate="D" pin="A"/>
<pinref part="R1" gate="R" pin="2"/>
<wire x1="170.18" y1="73.66" x2="170.18" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="R6" gate="R" pin="2"/>
<pinref part="D6" gate="D" pin="A"/>
<wire x1="208.28" y1="71.12" x2="208.28" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="R5" gate="R" pin="2"/>
<pinref part="D5" gate="D" pin="A"/>
<wire x1="200.66" y1="71.12" x2="200.66" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="R4" gate="R" pin="2"/>
<pinref part="D4" gate="D" pin="A"/>
<wire x1="193.04" y1="71.12" x2="193.04" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="R3" gate="R" pin="2"/>
<pinref part="D3" gate="D" pin="A"/>
<wire x1="185.42" y1="71.12" x2="185.42" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="R2" gate="R" pin="2"/>
<pinref part="D2" gate="D" pin="A"/>
<wire x1="177.8" y1="71.12" x2="177.8" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
