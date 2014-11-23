<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.1.0">
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
<layer number="51" name="tDocu" color="6" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="no" active="no"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="avr-7">
<description>&lt;b&gt;AVR Devices&lt;/b&gt;&lt;p&gt;
Version 7 - August 1, 2011.&lt;br&gt;&lt;br&gt;
Added ATmega164P/324P/644P devices for DIP and TQFP.
&lt;p&gt;
Version 4 - March 11, 2008.&lt;br&gt;&lt;br&gt;
This library now includes ONLY ATMEL AVR microcontrollers.  It is the result of merging all other available device libraries available at http://www.cadsoft.de/download as of the time it was made.  In addition to the legacy AT90* devices, it includes most ATMEGA devices including the new 48/88/168, most ATTiny devices and a set of ISP and JTAG pin headers.&lt;p&gt;
Based on the following sources:&lt;p&gt;
&lt;ul&gt;
&lt;li&gt;www.atmel.com
&lt;li&gt; file at90smcu_v400.zip
&lt;li&gt;avr.lbr and atmel.lbr as provided by CadSoft
&lt;li&gt;avr-1.lbr by David Blundell
&lt;li&gt;avr-2.lbr by Boris Zalokar
&lt;li&gt;avr-3.lbr by Carson Reynolds
&lt;li&gt;attiny24_44_84.lbr by Pawel Szramowski (ATTiny24/44/84 devices)
&lt;li&gt;atmel.lbr by Bob Starr (ISP headers)
&lt;li&gt;moates_custom_parts.lbr (edge ISP)
&lt;li&gt;other misc sources
&lt;/ul&gt;
&lt;author&gt;Revised by David Blundell (blundar at gmail dot com) and others.&lt;/author&gt;
&lt;p&gt;
&lt;author&gt;Added Mega162, Tiny2313 John Lussmyer (cougar at casadelgato.com)&lt;/author&gt;
&lt;p&gt;
&lt;author&gt;Added XMega A1,A3,A4,D3,D4 John Lussmyer Aug 1, 2011(cougar at casadelgato.com)&lt;/author&gt;</description>
<packages>
<package name="TQFP44">
<description>&lt;B&gt;Thin Plasic Quad Flat Package&lt;/B&gt;</description>
<wire x1="-4.8" y1="4.4" x2="-4.4" y2="4.8" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="4.8" x2="4.4" y2="4.8" width="0.2032" layer="21"/>
<wire x1="4.4" y1="4.8" x2="4.8" y2="4.4" width="0.2032" layer="21"/>
<wire x1="4.8" y1="4.4" x2="4.8" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="4.8" y1="-4.4" x2="4.4" y2="-4.8" width="0.2032" layer="21"/>
<wire x1="4.4" y1="-4.8" x2="-4.4" y2="-4.8" width="0.2032" layer="21"/>
<wire x1="-4.4" y1="-4.8" x2="-4.8" y2="-4.4" width="0.2032" layer="21"/>
<wire x1="-4.8" y1="-4.4" x2="-4.8" y2="4.4" width="0.2032" layer="21"/>
<circle x="-4" y="4" radius="0.2827" width="0.254" layer="21"/>
<smd name="1" x="-5.8" y="4" dx="1.5" dy="0.5" layer="1"/>
<smd name="2" x="-5.8" y="3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="3" x="-5.8" y="2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="4" x="-5.8" y="1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="5" x="-5.8" y="0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="6" x="-5.8" y="0" dx="1.5" dy="0.5" layer="1"/>
<smd name="7" x="-5.8" y="-0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="8" x="-5.8" y="-1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="9" x="-5.8" y="-2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="10" x="-5.8" y="-3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="11" x="-5.8" y="-4" dx="1.5" dy="0.5" layer="1"/>
<smd name="12" x="-4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="13" x="-3.2" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="14" x="-2.4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="15" x="-1.6" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="16" x="-0.8" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="17" x="0" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="18" x="0.8" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="19" x="1.6" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="20" x="2.4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="21" x="3.2" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="22" x="4" y="-5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="23" x="5.8" y="-4" dx="1.5" dy="0.5" layer="1"/>
<smd name="24" x="5.8" y="-3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="25" x="5.8" y="-2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="26" x="5.8" y="-1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="27" x="5.8" y="-0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="28" x="5.8" y="0" dx="1.5" dy="0.5" layer="1"/>
<smd name="29" x="5.8" y="0.8" dx="1.5" dy="0.5" layer="1"/>
<smd name="30" x="5.8" y="1.6" dx="1.5" dy="0.5" layer="1"/>
<smd name="31" x="5.8" y="2.4" dx="1.5" dy="0.5" layer="1"/>
<smd name="32" x="5.8" y="3.2" dx="1.5" dy="0.5" layer="1"/>
<smd name="33" x="5.8" y="4" dx="1.5" dy="0.5" layer="1"/>
<smd name="34" x="4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="35" x="3.2" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="36" x="2.4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="37" x="1.6" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="38" x="0.8" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="39" x="0" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="40" x="-0.8" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="41" x="-1.6" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="42" x="-2.4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="43" x="-3.2" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<smd name="44" x="-4" y="5.8" dx="0.5" dy="1.5" layer="1"/>
<text x="-3.81" y="6.985" size="1.778" layer="25">&gt;NAME</text>
<text x="-4.445" y="-8.7551" size="1.778" layer="27">&gt;VALUE</text>
<rectangle x1="-6.1001" y1="3.8001" x2="-4.95" y2="4.1999" layer="51"/>
<rectangle x1="-6.1001" y1="3" x2="-4.95" y2="3.4" layer="51"/>
<rectangle x1="-6.1001" y1="2.1999" x2="-4.95" y2="2.5999" layer="51"/>
<rectangle x1="-6.1001" y1="1.4" x2="-4.95" y2="1.8001" layer="51"/>
<rectangle x1="-6.1001" y1="0.5999" x2="-4.95" y2="1" layer="51"/>
<rectangle x1="-6.1001" y1="-0.1999" x2="-4.95" y2="0.1999" layer="51"/>
<rectangle x1="-6.1001" y1="-1" x2="-4.95" y2="-0.5999" layer="51"/>
<rectangle x1="-6.1001" y1="-1.8001" x2="-4.95" y2="-1.4" layer="51"/>
<rectangle x1="-6.1001" y1="-2.5999" x2="-4.95" y2="-2.1999" layer="51"/>
<rectangle x1="-6.1001" y1="-3.4" x2="-4.95" y2="-3" layer="51"/>
<rectangle x1="-6.1001" y1="-4.1999" x2="-4.95" y2="-3.8001" layer="51"/>
<rectangle x1="-4.1999" y1="-6.1001" x2="-3.8001" y2="-4.95" layer="51"/>
<rectangle x1="-3.4" y1="-6.1001" x2="-3" y2="-4.95" layer="51"/>
<rectangle x1="-2.5999" y1="-6.1001" x2="-2.1999" y2="-4.95" layer="51"/>
<rectangle x1="-1.8001" y1="-6.1001" x2="-1.4" y2="-4.95" layer="51"/>
<rectangle x1="-1" y1="-6.1001" x2="-0.5999" y2="-4.95" layer="51"/>
<rectangle x1="-0.1999" y1="-6.1001" x2="0.1999" y2="-4.95" layer="51"/>
<rectangle x1="0.5999" y1="-6.1001" x2="1" y2="-4.95" layer="51"/>
<rectangle x1="1.4" y1="-6.1001" x2="1.8001" y2="-4.95" layer="51"/>
<rectangle x1="2.1999" y1="-6.1001" x2="2.5999" y2="-4.95" layer="51"/>
<rectangle x1="3" y1="-6.1001" x2="3.4" y2="-4.95" layer="51"/>
<rectangle x1="3.8001" y1="-6.1001" x2="4.1999" y2="-4.95" layer="51"/>
<rectangle x1="4.95" y1="-4.1999" x2="6.1001" y2="-3.8001" layer="51"/>
<rectangle x1="4.95" y1="-3.4" x2="6.1001" y2="-3" layer="51"/>
<rectangle x1="4.95" y1="-2.5999" x2="6.1001" y2="-2.1999" layer="51"/>
<rectangle x1="4.95" y1="-1.8001" x2="6.1001" y2="-1.4" layer="51"/>
<rectangle x1="4.95" y1="-1" x2="6.1001" y2="-0.5999" layer="51"/>
<rectangle x1="4.95" y1="-0.1999" x2="6.1001" y2="0.1999" layer="51"/>
<rectangle x1="4.95" y1="0.5999" x2="6.1001" y2="1" layer="51"/>
<rectangle x1="4.95" y1="1.4" x2="6.1001" y2="1.8001" layer="51"/>
<rectangle x1="4.95" y1="2.1999" x2="6.1001" y2="2.5999" layer="51"/>
<rectangle x1="4.95" y1="3" x2="6.1001" y2="3.4" layer="51"/>
<rectangle x1="4.95" y1="3.8001" x2="6.1001" y2="4.1999" layer="51"/>
<rectangle x1="3.8001" y1="4.95" x2="4.1999" y2="6.1001" layer="51"/>
<rectangle x1="3" y1="4.95" x2="3.4" y2="6.1001" layer="51"/>
<rectangle x1="2.1999" y1="4.95" x2="2.5999" y2="6.1001" layer="51"/>
<rectangle x1="1.4" y1="4.95" x2="1.8001" y2="6.1001" layer="51"/>
<rectangle x1="0.5999" y1="4.95" x2="1" y2="6.1001" layer="51"/>
<rectangle x1="-0.1999" y1="4.95" x2="0.1999" y2="6.1001" layer="51"/>
<rectangle x1="-1" y1="4.95" x2="-0.5999" y2="6.1001" layer="51"/>
<rectangle x1="-1.8001" y1="4.95" x2="-1.4" y2="6.1001" layer="51"/>
<rectangle x1="-2.5999" y1="4.95" x2="-2.1999" y2="6.1001" layer="51"/>
<rectangle x1="-3.4" y1="4.95" x2="-3" y2="6.1001" layer="51"/>
<rectangle x1="-4.1999" y1="4.95" x2="-3.8001" y2="6.1001" layer="51"/>
</package>
<package name="QFN44">
<description>QFN 44 pin (also known as VQFN, and MLF)</description>
<wire x1="-3.4" y1="2.8" x2="-2.8" y2="3.4" width="0.254" layer="21"/>
<wire x1="-2.8" y1="3.4" x2="2.8" y2="3.4" width="0.254" layer="51"/>
<wire x1="2.8" y1="3.4" x2="3.4" y2="2.8" width="0.254" layer="21"/>
<wire x1="3.4" y1="2.8" x2="3.4" y2="-2.8" width="0.254" layer="51"/>
<wire x1="3.4" y1="-2.8" x2="2.8" y2="-3.4" width="0.254" layer="21"/>
<wire x1="2.8" y1="-3.4" x2="-2.8" y2="-3.4" width="0.254" layer="51"/>
<wire x1="-2.8" y1="-3.4" x2="-3.4" y2="-2.8" width="0.254" layer="21"/>
<wire x1="-3.4" y1="-2.8" x2="-3.4" y2="2.8" width="0.254" layer="51"/>
<circle x="-2.25" y="2.25" radius="0.1581" width="0.254" layer="21"/>
<smd name="1" x="-3.325" y="2.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="2" x="-3.325" y="2" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="3" x="-3.325" y="1.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="4" x="-3.325" y="1" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="5" x="-3.325" y="0.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="6" x="-3.325" y="0" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="7" x="-3.325" y="-0.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="8" x="-3.325" y="-1" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="9" x="-3.325" y="-1.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="10" x="-3.325" y="-2" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="11" x="-3.325" y="-2.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="12" x="-2.5" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="13" x="-2" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="14" x="-1.5" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="15" x="-1" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="16" x="-0.5" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="17" x="0" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="18" x="0.5" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="19" x="1" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="20" x="1.5" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="21" x="2" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="22" x="2.5" y="-3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="23" x="3.325" y="-2.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="24" x="3.325" y="-2" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="25" x="3.325" y="-1.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="26" x="3.325" y="-1" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="27" x="3.325" y="-0.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="28" x="3.325" y="0" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="29" x="3.325" y="0.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="30" x="3.325" y="1" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="31" x="3.325" y="1.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="32" x="3.325" y="2" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="33" x="3.325" y="2.5" dx="0.7" dy="0.3" layer="1" roundness="50"/>
<smd name="34" x="2.5" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="35" x="2" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="36" x="1.5" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="37" x="1" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="38" x="0.5" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="39" x="0" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="40" x="-0.5" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="41" x="-1" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="42" x="-1.5" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="43" x="-2" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<smd name="44" x="-2.5" y="3.325" dx="0.3" dy="0.7" layer="1" roundness="50"/>
<text x="-2.552" y="0.558" size="1.27" layer="25">&gt;NAME</text>
<text x="-2.302" y="-1.855" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-3.5" y1="2.375" x2="-3" y2="2.625" layer="51"/>
<rectangle x1="-3.5" y1="1.875" x2="-3" y2="2.125" layer="51"/>
<rectangle x1="-3.5" y1="1.375" x2="-3" y2="1.625" layer="51"/>
<rectangle x1="-3.5" y1="0.875" x2="-3" y2="1.125" layer="51"/>
<rectangle x1="-3.5" y1="0.375" x2="-3" y2="0.625" layer="51"/>
<rectangle x1="-3.5" y1="-0.125" x2="-3" y2="0.125" layer="51"/>
<rectangle x1="-3.5" y1="-0.625" x2="-3" y2="-0.375" layer="51"/>
<rectangle x1="-3.5" y1="-1.125" x2="-3" y2="-0.875" layer="51"/>
<rectangle x1="-3.5" y1="-1.625" x2="-3" y2="-1.375" layer="51"/>
<rectangle x1="-3.5" y1="-2.125" x2="-3" y2="-1.875" layer="51"/>
<rectangle x1="-3.5" y1="-2.625" x2="-3" y2="-2.375" layer="51"/>
<rectangle x1="-2.625" y1="-3.5" x2="-2.375" y2="-3" layer="51"/>
<rectangle x1="-2.125" y1="-3.5" x2="-1.875" y2="-3" layer="51"/>
<rectangle x1="-1.625" y1="-3.5" x2="-1.375" y2="-3" layer="51"/>
<rectangle x1="-1.125" y1="-3.5" x2="-0.875" y2="-3" layer="51"/>
<rectangle x1="-0.625" y1="-3.5" x2="-0.375" y2="-3" layer="51"/>
<rectangle x1="-0.125" y1="-3.5" x2="0.125" y2="-3" layer="51"/>
<rectangle x1="0.375" y1="-3.5" x2="0.625" y2="-3" layer="51"/>
<rectangle x1="0.875" y1="-3.5" x2="1.125" y2="-3" layer="51"/>
<rectangle x1="1.375" y1="-3.5" x2="1.625" y2="-3" layer="51"/>
<rectangle x1="1.875" y1="-3.5" x2="2.125" y2="-3" layer="51"/>
<rectangle x1="2.375" y1="-3.5" x2="2.625" y2="-3" layer="51"/>
<rectangle x1="3" y1="-2.625" x2="3.5" y2="-2.375" layer="51"/>
<rectangle x1="3" y1="-2.125" x2="3.5" y2="-1.875" layer="51"/>
<rectangle x1="3" y1="-1.625" x2="3.5" y2="-1.375" layer="51"/>
<rectangle x1="3" y1="-1.125" x2="3.5" y2="-0.875" layer="51"/>
<rectangle x1="3" y1="-0.625" x2="3.5" y2="-0.375" layer="51"/>
<rectangle x1="3" y1="-0.125" x2="3.5" y2="0.125" layer="51"/>
<rectangle x1="3" y1="0.375" x2="3.5" y2="0.625" layer="51"/>
<rectangle x1="3" y1="0.875" x2="3.5" y2="1.125" layer="51"/>
<rectangle x1="3" y1="1.375" x2="3.5" y2="1.625" layer="51"/>
<rectangle x1="3" y1="1.875" x2="3.5" y2="2.125" layer="51"/>
<rectangle x1="3" y1="2.375" x2="3.5" y2="2.625" layer="51"/>
<rectangle x1="2.375" y1="3" x2="2.625" y2="3.5" layer="51"/>
<rectangle x1="1.875" y1="3" x2="2.125" y2="3.5" layer="51"/>
<rectangle x1="1.375" y1="3" x2="1.625" y2="3.5" layer="51"/>
<rectangle x1="0.875" y1="3" x2="1.125" y2="3.5" layer="51"/>
<rectangle x1="0.375" y1="3" x2="0.625" y2="3.5" layer="51"/>
<rectangle x1="-0.125" y1="3" x2="0.125" y2="3.5" layer="51"/>
<rectangle x1="-0.625" y1="3" x2="-0.375" y2="3.5" layer="51"/>
<rectangle x1="-1.125" y1="3" x2="-0.875" y2="3.5" layer="51"/>
<rectangle x1="-1.625" y1="3" x2="-1.375" y2="3.5" layer="51"/>
<rectangle x1="-2.125" y1="3" x2="-1.875" y2="3.5" layer="51"/>
<rectangle x1="-2.625" y1="3" x2="-2.375" y2="3.5" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="XMEGA-A4">
<wire x1="-25.4" y1="40.64" x2="25.4" y2="40.64" width="0.254" layer="94"/>
<wire x1="25.4" y1="40.64" x2="25.4" y2="-45.72" width="0.254" layer="94"/>
<wire x1="25.4" y1="-45.72" x2="-25.4" y2="-45.72" width="0.254" layer="94"/>
<wire x1="-25.4" y1="-45.72" x2="-25.4" y2="40.64" width="0.254" layer="94"/>
<text x="-25.4" y="41.91" size="1.9304" layer="95" ratio="5">&gt;NAME</text>
<text x="-11.684" y="38.354" size="1.9304" layer="96" ratio="5">&gt;VALUE</text>
<pin name="PA3(ADC3)" x="-30.48" y="27.94" length="middle"/>
<pin name="PA4(ADC4)" x="-30.48" y="25.4" length="middle"/>
<pin name="PA5(ADC5)" x="-30.48" y="22.86" length="middle"/>
<pin name="PB1(ADC9)" x="-30.48" y="7.62" length="middle"/>
<pin name="GND@1" x="30.48" y="-30.48" length="middle" direction="pwr" rot="R180"/>
<pin name="VCC@1" x="30.48" y="-17.78" length="middle" direction="pwr" rot="R180"/>
<pin name="PC1(OC0B/XCK0/SCL)" x="-30.48" y="-7.62" length="middle"/>
<pin name="AVCC" x="30.48" y="-10.16" length="middle" direction="pwr" rot="R180"/>
<pin name="PA1(ADC1)" x="-30.48" y="33.02" length="middle"/>
<pin name="PA2(ADC2)" x="-30.48" y="30.48" length="middle"/>
<pin name="PB2(ADC10/DAC0)" x="-30.48" y="5.08" length="middle"/>
<pin name="GND@2" x="30.48" y="-33.02" length="middle" direction="pwr" rot="R180"/>
<pin name="PC0(OC0A/SDA)" x="-30.48" y="-5.08" length="middle"/>
<pin name="PC2(OC0C/RXD0)" x="-30.48" y="-10.16" length="middle"/>
<pin name="GND@3" x="30.48" y="-35.56" length="middle" direction="pwr" rot="R180"/>
<pin name="PA0(ADC0/AREF)" x="-30.48" y="35.56" length="middle"/>
<pin name="PA6(ADC6)" x="-30.48" y="20.32" length="middle"/>
<pin name="PB3(ADC11/DAC1)" x="-30.48" y="2.54" length="middle"/>
<pin name="PC3(OC0D/TXD0)" x="-30.48" y="-12.7" length="middle"/>
<pin name="PC4(OC1A/!SS!)" x="-30.48" y="-15.24" length="middle"/>
<pin name="PC5(OC1B/MOSI/XCK1)" x="-30.48" y="-17.78" length="middle"/>
<pin name="PR1(XTAL1/TOSC1)" x="-30.48" y="-40.64" length="middle"/>
<pin name="GND@4" x="30.48" y="-38.1" length="middle" direction="pwr" rot="R180"/>
<pin name="PA7/(ADC7/AC0-OUT)" x="-30.48" y="17.78" length="middle"/>
<pin name="PB0(ADC8/AREF)" x="-30.48" y="10.16" length="middle"/>
<pin name="PC6(MISO/RXD1)" x="-30.48" y="-20.32" length="middle"/>
<pin name="PC7(SCK/TXD1/CLKO/EVO)" x="-30.48" y="-22.86" length="middle"/>
<pin name="PR0(XTAL2/TOSC1)" x="-30.48" y="-35.56" length="middle"/>
<pin name="PDI-CLK/!RESET" x="-30.48" y="-30.48" length="middle" direction="in"/>
<pin name="PD4(OC1A/!SS!)" x="30.48" y="22.86" length="middle" rot="R180"/>
<pin name="PD0(OC0A)" x="30.48" y="33.02" length="middle" rot="R180"/>
<pin name="PDI-DATA" x="-30.48" y="-27.94" length="middle"/>
<pin name="PE2(OC0C/RXD0)" x="30.48" y="2.54" length="middle" rot="R180"/>
<pin name="PE1(OC0B/XCK0/SCL)" x="30.48" y="5.08" length="middle" rot="R180"/>
<pin name="PD7(TXD1/SCK/CLKO/EVO)" x="30.48" y="15.24" length="middle" rot="R180"/>
<pin name="PD5(OC1B/XCK1/MOSI)" x="30.48" y="20.32" length="middle" rot="R180"/>
<pin name="PD1(OC0B/XCK0)" x="30.48" y="30.48" length="middle" rot="R180"/>
<pin name="VCC@2" x="30.48" y="-20.32" length="middle" direction="pwr" rot="R180"/>
<pin name="PE3(OC0D/TXD0)" x="30.48" y="0" length="middle" rot="R180"/>
<pin name="VCC@3" x="30.48" y="-22.86" length="middle" direction="pwr" rot="R180"/>
<pin name="PE0(OC0A/SDA)" x="30.48" y="7.62" length="middle" rot="R180"/>
<pin name="PD6(RXD1/MISO)" x="30.48" y="17.78" length="middle" rot="R180"/>
<pin name="PD3(OC0D/TXD0)" x="30.48" y="25.4" length="middle" rot="R180"/>
<pin name="PD2(OC0C/RXD0)" x="30.48" y="27.94" length="middle" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="XMEGA-A4">
<description>Atmel XMega A4 series processor</description>
<gates>
<gate name="G$1" symbol="XMEGA-A4" x="0" y="2.54"/>
</gates>
<devices>
<device name="TQFP" package="TQFP44">
<connects>
<connect gate="G$1" pin="AVCC" pad="39"/>
<connect gate="G$1" pin="GND@1" pad="38"/>
<connect gate="G$1" pin="GND@2" pad="8"/>
<connect gate="G$1" pin="GND@3" pad="18"/>
<connect gate="G$1" pin="GND@4" pad="30"/>
<connect gate="G$1" pin="PA0(ADC0/AREF)" pad="40"/>
<connect gate="G$1" pin="PA1(ADC1)" pad="41"/>
<connect gate="G$1" pin="PA2(ADC2)" pad="42"/>
<connect gate="G$1" pin="PA3(ADC3)" pad="43"/>
<connect gate="G$1" pin="PA4(ADC4)" pad="44"/>
<connect gate="G$1" pin="PA5(ADC5)" pad="1"/>
<connect gate="G$1" pin="PA6(ADC6)" pad="2"/>
<connect gate="G$1" pin="PA7/(ADC7/AC0-OUT)" pad="3"/>
<connect gate="G$1" pin="PB0(ADC8/AREF)" pad="4"/>
<connect gate="G$1" pin="PB1(ADC9)" pad="5"/>
<connect gate="G$1" pin="PB2(ADC10/DAC0)" pad="6"/>
<connect gate="G$1" pin="PB3(ADC11/DAC1)" pad="7"/>
<connect gate="G$1" pin="PC0(OC0A/SDA)" pad="10"/>
<connect gate="G$1" pin="PC1(OC0B/XCK0/SCL)" pad="11"/>
<connect gate="G$1" pin="PC2(OC0C/RXD0)" pad="12"/>
<connect gate="G$1" pin="PC3(OC0D/TXD0)" pad="13"/>
<connect gate="G$1" pin="PC4(OC1A/!SS!)" pad="14"/>
<connect gate="G$1" pin="PC5(OC1B/MOSI/XCK1)" pad="15"/>
<connect gate="G$1" pin="PC6(MISO/RXD1)" pad="16"/>
<connect gate="G$1" pin="PC7(SCK/TXD1/CLKO/EVO)" pad="17"/>
<connect gate="G$1" pin="PD0(OC0A)" pad="20"/>
<connect gate="G$1" pin="PD1(OC0B/XCK0)" pad="21"/>
<connect gate="G$1" pin="PD2(OC0C/RXD0)" pad="22"/>
<connect gate="G$1" pin="PD3(OC0D/TXD0)" pad="23"/>
<connect gate="G$1" pin="PD4(OC1A/!SS!)" pad="24"/>
<connect gate="G$1" pin="PD5(OC1B/XCK1/MOSI)" pad="25"/>
<connect gate="G$1" pin="PD6(RXD1/MISO)" pad="26"/>
<connect gate="G$1" pin="PD7(TXD1/SCK/CLKO/EVO)" pad="27"/>
<connect gate="G$1" pin="PDI-CLK/!RESET" pad="35"/>
<connect gate="G$1" pin="PDI-DATA" pad="34"/>
<connect gate="G$1" pin="PE0(OC0A/SDA)" pad="28"/>
<connect gate="G$1" pin="PE1(OC0B/XCK0/SCL)" pad="29"/>
<connect gate="G$1" pin="PE2(OC0C/RXD0)" pad="32"/>
<connect gate="G$1" pin="PE3(OC0D/TXD0)" pad="33"/>
<connect gate="G$1" pin="PR0(XTAL2/TOSC1)" pad="36"/>
<connect gate="G$1" pin="PR1(XTAL1/TOSC1)" pad="37"/>
<connect gate="G$1" pin="VCC@1" pad="9"/>
<connect gate="G$1" pin="VCC@2" pad="19"/>
<connect gate="G$1" pin="VCC@3" pad="31"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="VQFN" package="QFN44">
<connects>
<connect gate="G$1" pin="AVCC" pad="39"/>
<connect gate="G$1" pin="GND@1" pad="38"/>
<connect gate="G$1" pin="GND@2" pad="8"/>
<connect gate="G$1" pin="GND@3" pad="18"/>
<connect gate="G$1" pin="GND@4" pad="30"/>
<connect gate="G$1" pin="PA0(ADC0/AREF)" pad="40"/>
<connect gate="G$1" pin="PA1(ADC1)" pad="41"/>
<connect gate="G$1" pin="PA2(ADC2)" pad="42"/>
<connect gate="G$1" pin="PA3(ADC3)" pad="43"/>
<connect gate="G$1" pin="PA4(ADC4)" pad="44"/>
<connect gate="G$1" pin="PA5(ADC5)" pad="1"/>
<connect gate="G$1" pin="PA6(ADC6)" pad="2"/>
<connect gate="G$1" pin="PA7/(ADC7/AC0-OUT)" pad="3"/>
<connect gate="G$1" pin="PB0(ADC8/AREF)" pad="4"/>
<connect gate="G$1" pin="PB1(ADC9)" pad="5"/>
<connect gate="G$1" pin="PB2(ADC10/DAC0)" pad="6"/>
<connect gate="G$1" pin="PB3(ADC11/DAC1)" pad="7"/>
<connect gate="G$1" pin="PC0(OC0A/SDA)" pad="10"/>
<connect gate="G$1" pin="PC1(OC0B/XCK0/SCL)" pad="11"/>
<connect gate="G$1" pin="PC2(OC0C/RXD0)" pad="12"/>
<connect gate="G$1" pin="PC3(OC0D/TXD0)" pad="13"/>
<connect gate="G$1" pin="PC4(OC1A/!SS!)" pad="14"/>
<connect gate="G$1" pin="PC5(OC1B/MOSI/XCK1)" pad="15"/>
<connect gate="G$1" pin="PC6(MISO/RXD1)" pad="16"/>
<connect gate="G$1" pin="PC7(SCK/TXD1/CLKO/EVO)" pad="17"/>
<connect gate="G$1" pin="PD0(OC0A)" pad="20"/>
<connect gate="G$1" pin="PD1(OC0B/XCK0)" pad="21"/>
<connect gate="G$1" pin="PD2(OC0C/RXD0)" pad="22"/>
<connect gate="G$1" pin="PD3(OC0D/TXD0)" pad="23"/>
<connect gate="G$1" pin="PD4(OC1A/!SS!)" pad="24"/>
<connect gate="G$1" pin="PD5(OC1B/XCK1/MOSI)" pad="25"/>
<connect gate="G$1" pin="PD6(RXD1/MISO)" pad="26"/>
<connect gate="G$1" pin="PD7(TXD1/SCK/CLKO/EVO)" pad="27"/>
<connect gate="G$1" pin="PDI-CLK/!RESET" pad="35"/>
<connect gate="G$1" pin="PDI-DATA" pad="34"/>
<connect gate="G$1" pin="PE0(OC0A/SDA)" pad="28"/>
<connect gate="G$1" pin="PE1(OC0B/XCK0/SCL)" pad="29"/>
<connect gate="G$1" pin="PE2(OC0C/RXD0)" pad="32"/>
<connect gate="G$1" pin="PE3(OC0D/TXD0)" pad="33"/>
<connect gate="G$1" pin="PR0(XTAL2/TOSC1)" pad="36"/>
<connect gate="G$1" pin="PR1(XTAL1/TOSC1)" pad="37"/>
<connect gate="G$1" pin="VCC@1" pad="9"/>
<connect gate="G$1" pin="VCC@2" pad="19"/>
<connect gate="G$1" pin="VCC@3" pad="31"/>
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
<part name="U$1" library="avr-7" deviceset="XMEGA-A4" device="TQFP"/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="68.58" y="58.42"/>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
