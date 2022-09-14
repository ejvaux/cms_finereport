<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20211223" releaseVersion="10.0.0">
<TableDataMap>
<TableData name="ds1" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="id"/>
<O>
<![CDATA[]]></O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM dbo.item_details_view
where id = '${id}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="ds2" class="com.fr.data.impl.DBTableData">
<Parameters/>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM [dbo]A.[transaction_types]A]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
</TableDataMap>
<ReportFitAttr fitStateInPC="0" fitFont="false"/>
<FormMobileAttr>
<FormMobileAttr refresh="false" isUseHTML="false" isMobileOnly="true" isAdaptivePropertyAutoMatch="false" appearRefresh="false" promptWhenLeaveWithoutSubmit="false" allowDoubleClickOrZoom="false"/>
</FormMobileAttr>
<Parameters/>
<Layout class="com.fr.form.ui.container.WBorderLayout">
<WidgetName name="form"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="form" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<ShowBookmarks showBookmarks="false"/>
<Center class="com.fr.form.ui.container.WFitLayout">
<WidgetName name="body"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="10" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<appFormBodyPadding class="com.fr.base.iofile.attr.FormBodyPaddingAttrMark">
<appFormBodyPadding interval="1">
<Margin top="4" left="4" bottom="4" right="4"/>
</appFormBodyPadding>
</appFormBodyPadding>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report3"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="report3" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report3"/>
<WidgetID widgetID="3e623f1a-845a-4451-904f-ea950e4b9f8e"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[762000,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[3962400,3962400,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="2" rs="8" s="0">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="image"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="8" cs="2" s="0">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="part_number"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Present class="com.fr.base.present.FormulaPresent">
<Content>
<![CDATA[=if($$$ = "" || $$$ = NULL,"ITEM DOES NOT EXISTS IN THE DATABASE",$$$)]]></Content>
</Present>
<Expand dir="0"/>
</C>
<C c="0" r="9" cs="2" s="0">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="description"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="10" cs="2" s="0">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="chinese_name"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="11" cs="2" s="0">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="total"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<Present class="com.fr.base.present.FormulaPresent">
<Content>
<![CDATA[=if($$$ = "" || $$$ = NULL,"Please check the QR Code or Part Number","Stocks: "+$$$)]]></Content>
</Present>
<Expand dir="0"/>
</C>
<C c="0" r="12" cs="2" s="1">
<O>
<![CDATA[View Transactions]]></O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="Transactions">
<JavaScript class="com.fr.js.ReportletHyperlink">
<JavaScript class="com.fr.js.ReportletHyperlink">
<Parameters>
<Parameter>
<Attributes name="item_id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$item_id]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="op"/>
<O>
<![CDATA[view]]></O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_blank]]></TargetFrame>
<Features width="600" height="400"/>
<ReportletName showPI="true">
<![CDATA[/item_status_web/item_transactions.cpt]]></ReportletName>
<Attr>
<DialogAttr class="com.fr.js.ReportletHyperlinkDialogAttr">
<O>
<![CDATA[]]></O>
<Location center="true"/>
</DialogAttr>
</Attr>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting>
<PaperSize width="24688800" height="43891200"/>
</PaperSetting>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Arial" style="0" size="72"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Arial" style="0" size="72" foreground="-16776961" underline="1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m<X%[P%i[[:X.roAPQ`L%5'dq>%sF8C#h1SN_cY'=K/9]A>$AJ0\=`ooP[da[N*/+Gb*8`f$Q
?Q"OIDlBOBF%ci/S"tMPA2c,$NI.htMMJIE-\^a*6`Sgo'ml?2)TdT"jAL\G;&`PLf"@<blA
^BK?*?oN)K]AYCRT1.t,08V2Be=@s'Xcp2QXa*]Ab="kP$0=lN^__laL\R)Q:c$en9/DUO*H3O
C^Kr+i*OW"=Los]AXD\:\.5\1k6<0t*$WeIN+D72JSYk2:Nl(ua/hD)iR`JFi6=-FrRICgl?Y
U3fEqH3/Dp3;)@Y?36DOS"J3,nS.N6`Ug@g!>lq-?QoQ#sO@-lA\(RTuuIAra+=&,omcIH,%
^8t$qV5PG3j$m@hraj\t4"R3u;e).(n/n[_J.D(bMDQ@(V_-E'#-S`rb_bpG>>8)K59W,jTd
,"3A+?6[]A8sP',6+5rlMBS>Ts#5t@R?`C^L"LtGH7#IIWD:Mo65kBD`;QS>hEl`-N9@4bJE;
us1?*6T1;==&tb\Pq&VrCTf#Mo?u/LL8ek7'<,f.YAm[)VmdBL<n9eqQIDHYJ@.HVc^BC+fq
dk6Rb/&?*gDE=m&f5BpWh/fiXXTYd4HX&)O7T/FVssbVYb&DB@f;ce7J(Tcd&uUKfj%UNk<l
9QNQ(#^GZ,b*Wl<]A"CLq)]AkRY_&`]A!kEgY5BeVBViW[:2U,J>l&$m$+Ec5*)CL0Yu?^0QjeL
o.lj9ri*LAA]Aj41=&;ITpn^WY-C)OWH4@ZbnD&su,*E_o;</*+(CHED'sX<GE',40J^5fN,'
kA"g[V=sF>Ug!?XG]AL1c4:]A#JVf<)5qf9eYh2FE):TV$67Jb=07&kM!\g<<@]ABc5fLb9&U'r
8`4Da-_*hX'j=0L+HsuVMqs_=dgtJatj2AqI-G`RDBrtl)4$mtfS%;G/h/mFgT[LG'6uq((]A
J2)OjDas/lPQ1TD(i"?`ii_1.-oJ3R+(8[:Lp\P0Y!>WqcLti0J"GKR!g6*SaR#uo)6/S7Z4
4_=ESC8g1Fi=H,^ss+dY6apmi^KJQDeq:?t-1'f=EF*de+p0JlIB0S<W%cLaV-FH5f>b:&oX
:kn5D39q!U6tHV4(J$ejTg'DIT:b)0$\I@^&?SR!s'H#Y5eE<;dephi>l*u!s4brK;(E!-6>
NC!0J"aKNBX1_+IuJQ]A/BIFH6\JqWJjk(Ye0'Z%(6D-L\8Lcj3W*T5m^SQTSO@qq$SNr.\r>
brD[g=T.K;#XAbe>krZ/K44=,8Zns"hC.0ieD_[k%2ee1-rBV!_qF'mNcqB+eG2X^YV3IG7;
ZZ!M"KCr$k`81>>UqL'C^j(p=<GsGWq7^mr2Bn.2UGipU@WdrQ'"Ntl*NeGncX;EV=Q>M/"n
V"Dnl:_a-VqhDsa`$G1=>nY.S.7N\Y.K&$_Qjg2O1t#NR[DV\RZU7&ZS9RZQoK2u+q+GL*g6
jV@DW>">)]AplY(5[('%Ep1ueq#K9fCdS94ODLjZ_\.+.FKSP6M8bH[IM:(W:9-q:o7)Tm"fJ
M/cW:aD>e<UjrqgtS$1BKIu.kU%`U-p4X)(A[hc4'IlLD7\V9>Ra.O=G2T6-2P9*?E#-k8,$
g@`Ea?pPUIr`L[Z*Rb`HD7q?O,N1`ggIJ?r75@o`IfMP[M:(d9)@8]A]AJ^-)W(puIB_Xqn8Z1
Z1<3dARTgM&_2I7<t5@qT57X;&W"4KL2T.(AG2<lH%efN.K0gs%e9;W1gD:c,Em&FD1n?H8m
M.'HY`RQu55Ai;+DW^T_!AI(<rlii@i80<)S=D*`Nc0Gu1jCOb.A?(hV=JmC2C1:.Pb2qmcb
n=o>l)`m3d#3`7L?HO]AXb!>$pXU+LekWghR=<BcgUYaRZNl0o;'6$8nOXTScPA4fC7k3E2Ir
A4A>T(D)4q&h_E`Wg)O-mH:@t1:_8skZ`00N*nC[++2N<gSah`:Ku2qtSeG&dS1dGe/;\[cY
/1tPMYs"6(.V]AoTS]AGA*W?0.!QkcC))>Se@p$RU%;h2dtseJN6dlJ.KIhfuQCi]Am$LFjgDq8
gh@2<TqsUZ/fJ'?_<gL/>U_$G]Af(XeBa@?r9R++p6okJ%qH@0i<tkH;F+>ge7`p!EB=c6'[.
('U6'A*:WES7p._I^GU`sqmRSPqZ^@*`FI'\S\rs:PB9OLI%@>=6OsCZA='(0:AJs&(o+9si
f7;5)9!@5s!;2I8IsfZU2q!XRs#/YYILFfFWI!n-4.<i?D#^f!Jl:'&Mq@gk9C=``*i5!gLi
N>*\mfl7p*uaVEdmk!=$XI>gXus8Us2B@#Q,m4f-q`:G46SNm.qDZNa=gBr^OYCemsOL6c<O
s@TndM;C'NS`Q]AgbH061C#4=VmSPmeW2'PPM]An=p',9pI$5u`N5[tV)fK)>8X&NtVCfX&sql
?`@+=m@SdI7OJ.QCtj(4[c92'-(NWSL,V`#)b:rheWJ(cL_4mfuXeslsFB]A9C'RC(HBd1Kn:
RZn(4tOiMci$F&ff&cur6@H\_iC\?]AAC3s@28kb3qLPjAou7p)FG-,!I*SY7b]A2,aVIa-:tX
djB8S:HSFF;"GLac2N=-%FsNVWOkRT<V.fGj$IhLNTNM+dF3u@nRu5j1@NT9Lh$8QG(,tF2V
s-TXGI@_4dN_]AKN7XpgC9VpY>;(E,Vrk<_aBOBR@dd"f[Xe#'neYL=lm;qH*F47:>fjX#ob"
3qTS`MXM)Z$60+FHjGCD?_=:hem9U00LQ$Z\8H'cG]ACKh92XZg*)P"mF(3PWn=,-Du%m`nR(
iZ(]A3-:V23#qll9s['VEB;)V./tZ-j'')ICjb@6'+ANcM43:j<:mo5p@%Xf>:?LG=sIP^-Ld
n"fa77[ZO;i?88i5!8_KpkA?[*Z6r]AY9*2%Te?J+pGlmUtZ:gQ5VMH1sI.uDe-N+UD]AU6N",
VrCGe.EHKB#54>,=&)ZodhX?pZ`!j0\D7BCb8*_AdBf@F6$j,E>DlY`R$!i;-fQa]Ad79$`(T
t:lA.oLs$U+:^#R^-mO::@CQ+LUpGtk-j]AQqsXC$+]Am80Oll:,M;j*de^N3n`e/,`c5\3_66
@AUi:]A8D7OjO]AhJ$3G7lAEHImP+]AL3%@'1B7CpKHR;hffSM$0,3$88D]AbJ@db]AAK>VE6cl8G
1YLUmO46RSOFNnHlun7a^KP5rq0T9EmsI&8e:h%A67[iOJp!RqUCL6I6`U.=m/*Zgu$3;b\M
('V;5m,qRlY^?^[j?mS^8@9ujT71NAWDU+a7@9^4eT\*R_Rpr\*D]A8?Or^^]A0R!H:>QbP[C6
T9.XR$7ICtdZOO>A`JqhhJ1Io?!:b6_LC_ZhRF#V>ZEWoRG)bK#a-S#B%qF8[>DI,*$c.g>L
s=p1kD"UjlSTlBVg_p"=j.jQQZRZ)/sKYQt/,h:[s^uN,+?@K0*[e09<3t[gP8j#4qTATqWk
=l=k0%2e!rE<Dd8M\uD+<g]A\C?%7qK;\N\pYSbN+aRL@CZBgl6-_W774ZPVNO[`WP>G7#c6,
Q5o[mgJ\R(7;F6QnS9qj,.0JTUVf_#&?0iY(R:[CSr4QqL]AOSr/Y0n[(i@8X#hHM2/E1h$@S
Nbj:W+>*OG6[`9n1pd,EWqkjG`Q.D<L2T3F78/!=U%q='G6jRINd]A,4+rk1"44O=F74(MJ"@
5jle=o;pL_-fmY]A9!mDR6Y.u-Z<+:6[(Kc98l#H(YimNSn[)V!;UP7^#%$l,VkM\AW>TBSl/
A5d[g)anJ_oc:ZN'i[QM!L]AlssqibH&j_iSHp"[O(r>_Kqml!No6@@X,NqqVthT(;O,9hE*_
kgg&dY7`\6dL=6!N&m2REErL0@BK$N.&`,28PGFdohA`/M8a()[A//HCCZk;]ADf*9(e_)=R1
T:.F.LIhfSmUjI6Za]AqRJaDbH5O&Z8aQCoDW^9/TV2G(f3$Ke&,*UoQA&Y@&\&q+4TrbND=n
+=+$=d5phfemoKb`E<-A.eQTq"jd*SF+'ZZf:mj\dDi@''3OfZq#?EsDZgXHntP<;II)>pk$
Y!1+\#9BH^?i_K+cs`^h);QB\.4T'Nb@\(@e$HC'+%%13O"9pW)[@[,cET%PG>B''#i40c0"
aDNfGu5uW.*A;Z&r*[IKI[u!a2GZlgNU6!BYm_#aoOJiUah+E_s6sYAYf;8/8T'Tt8,`NDKM
O]AJ<PIN4nUerjF^.?$$MQ_*!8^H-DM%g907t*p4JJD0iWu0&eY&"\h'Xm;jV-1\K.J2G[G"T
m4c%88#d<qT9Q[80ZHfo#sB;(Hlq!;Y/nNdCBH7=l9keg=8_H"8SiY]A.C%-IO8UDplNFqBqF
oX^@EW`N>sSf5HIN/7N%]AhY.[dME"FYaCXu4Vp0I-&..SZ_HeqG.+,CbI/4RE&W`ILc=VHUj
R/n7B&Iopr[CJ<?fd[K.''F]A#R:O>J*:\sAMc90'9tCp/(/S-#0ekFD3U'"7f_GZ"nb-"QoD
nr+La@!1]APf>`1a-@$QHs^\]AO6.,YGJH]Ackk)G=Nn?iQj5qH#KGld8]A6n6]A/s\sQ'#=4>&g\
t)V1A]A@nX2pS);#$#/Q.c1JsPs%n3oKnkX7<%bb??EbdaMVE<6U<?Fasq,/`khG0VQk9!MIL
/,Zej;'&A$2L^5.(Oo:0$GlJPI14Xe4.9-oJ7gT)@Gf<m`gB)BAor<P0nkX^&`BsNRYG!EG6
fL+r:]AONYDM#rBH-mVjA*1a*Q8rI/'q<0F0.dTD<0m@\UFk4$/of+s#k:UsY_>7hW?qNr/Rs
ge9Ki[R3]Ag_?XE'1_Bm18Iq?GZ*_H)Dpnas9>]Aei#.E$a>*5#?"\=s*:[/Y'X.!=&B*JR\1[
Y6Z_IR:B;giZf!a[NO8<3?D$o#89YuQ4EV+"!U@Ze6Gn(n@KZ,9_Xn+2.Va1u**0WA.S?INa
1N%Xb%S9"1a]A_1Nu6m6&P6>AB]A"[!Qb\ECCH?bE%bWDH?85co?/D>2Z7M*TeW@&cor?<E67Y
Fg;%5Js8hp;o0jN>rU@_S[bldaQ\$Op$gRnNqY5Yi<J@E_d6<7:m=AWqM*pG]Anh0,`kM0D82
=#U6/!uqIim"0Nn2>%Ff$*YbU`,RZUpg2>9bgkSBfE^j<n:>,f%B@;[DC$K]Aj+S!bN_Fr'u*
3SpC!R;R)@fbDX7*W&!1g-IL/U__9)X&!8n;bYDOJuhKCUM>HmMX1f5YWt)e&fY'!!Z>i2S)
#2U4Lp%9!5TH/n2^2iV%$it!$d&20uGbt?dJ!ZN#Fk'B6p!FWipm$/E=_SYN@Fe:HPNirACo
JN`$KT:IY8=qt>6EQ<S`[RMDaaWP%_]AP.21!j;Z/b0&k<2<[sb-gEo+[-$):`9iJJbfp:R:H
6ZjSX)o5drf["c=i:++J[Vo#eBk]A2A.GVfjR.Qp6q?u3+(r[c=fgcJH3BXL?E82r2:\D&]A3C
/VR==XXGFpU`]AYrg;!cO"k!HW=YRG4Cc#Z/BG%eNX,Zgb[WCG:&F!S&-!(m?n4c0)JN8mN)T
A*`k2aCA!\0OleDlnU7Y>3^5`+*Y(h(Aq2PIJ^Hhi`S=@'*>"jo%ND`n=h;(7*h"sqW!)Vo:
Rs"nb!ML,JpqR+@d4VRn<=o"L'<Dfo5)rih%2UaJBdQOZ6Fk>HFi*a5BMO#^%XeAT$B@1eC.
E=0H(Dg!3oXg3$Ico/]AEEgfMB=1FGH22a/mA5Ochg$lfh"<aK::(<r-_a0<-G@0=GF@/3kOp
ahTUg*YQiJ8<mbG>RJPVo`/q^(I[0?;%UWASc[o/Pl*G+SS-h%2t3qbn&.TSOr_<7F*X4J-t
QTUFcYG'&V:b,5SJ\d,&C-%&eg=.qdKAA]Aar'\Wdjaq=fWgB"1))R!X=,a,,H^'n-gG'=dDN
(5=@TrV3*H1`gpbGT/SpIb(DaKl')Fqa7d6q_RE_&"cjnB@3!_J?eM'\i0Td(n;Fn:&j:2]Ai
r'eg#D3*W=jJ_7bF6CKt-1sOdH)^;WR]A8o/Q'FeP!a6D'm6\-(:."MjH4gVW`HB/5hsQ[U%Z
WHTc*#T=mne[f6j:$_M6F!"=l1<Sp9;s*_k9#.^E&q4^I.+.Ahi:mLd!#Inc;$_i]A6.0NN12
>>`h?KC3fb9^-Pr-X)^)<YiYE7W:Q"h>AlH%*$?k$4GI/A]A4^:WLE(%Vp0<+5AZdAAkO/B!0
]A0c88KIcr1ChU&C.E'KliC)=_,W"Rk1,'.?3VdDDLP>(q;0VIiRJO_`ReZ57MA#3PN'(n[^=
'!K&1kG5]Ahm$o`.-dqK;-IQ$(jr.t5/jo)pl-WNMUMb/mg(%j=_W_qq,I0po4#3U0.B;s]ALM
,CGZ,5#S`]AHh!TiLui%SGsJM5D^!$h2TGg%nA,Q\JSCT16E<_J$+$TC_S`pQ"[n1\Z_pGuD+
sIX`"!Lf0HWB:;`!W$XLjA'%s*T3J2l-QQ5fDY7_6(hn6<CN6#;f_=8K=FGA>:rqLYOf]A91'
-b3$'0.':^18tOb7\^S):KU0NhduGNpgsM4'OjQ00Mc<$f67\+agRHJ!AK2Z=O&B^011H\ch
aZTSjlhWYH)l]ALd'fg+sr9TndN0Dg`lr@#KKp:.H6`P/DUHK[&BViD%b7/"`2qCUX?,6u7/4
e%>Qc,N+'E@P:t'9(qc9-cq@YQ[nsTBu8#JXUZd^gkf5:mos&D9XT1sD!&0@Fql.h-=2BEq5
m%1q8Z:fL\kKI:)!![Q!?eEoI&QUW]Ab!>XCdf7;dPi]A4+TVapPjZmktYAoj<2>U,MYZ.Z%TA
ZaX\Aj`(i,U<Q*G-L+(_#H@J&(@5L<f@WQCl<+>X9=dl:#E,^o#MX9a04S8n>-3aSU&G?652
CqsONS#G&QAp2aBtW8L4cNFYa^'0p0l&>"X,)>OoIT9rhaY2Hd/$#+K<bgr;>97X9/]AI(dXn
gPZZ8"H<;Bq_]A!@c<M"dh9-7E1HDt^p?\0HR_h6C>mMYY)FO^Wb<5El%]A:SW:B*8T9"QraZ<
"5ngF5F]AFn.mDL8cL/B(6!Po=ASo->X+cHAZ?b.R?,lnr%f]AbS39kg$^8l2$h1.qZeBsX!3V
`+H9=smXH!Eo4,[3pZ4MuCch\8X3\^HREXWhD%n$3=kSV/6c60DaHM_hCA;:$JYI0VRqFYMm
;MM,+WKqI!0KLs#Y@Wle9ZeP<IBIdh2XeAGLaA`:8+K.jp(@'YO,AedMJRY*f=_pc*pg34;c
irt(:/If#3V]A'3m8o\pb@i!Mhjkr>"^#,.^7QINr[,1IP<3)^.O>Tj<./I1Kq_E'VDJ%o(YZ
0PlWO98+N\mUdSN`74bDU?8oGP?9GV`6Le33"a7RSq/'mc_D_\i+N[=7[]A9LV/@TjT%NaHlp
#GNVDQc1-r_a[+Y!(X,YN4uuC;6i9E:,fCbh4^oQP$W!$?X\5Qdah+<NI]AY=i`gPD6!.gSXA
V&44N1>MD0$'tC,M^?m3'ct!PX>]A7$o/`_>4\#'tJYPEC9RroF?mAeX2dAb=TEsrAigX!C#a
$VA:\R(#6<*9#!69E0PH<cK\TQ[/*=_O+\ereem4I)(P/mimg[MMc`9L5<CZFcoHCAHef_X5
NHn^eXLTmmQm]AP:-O%ih4hW0J+.MfdRCX!acic.]A.bc,NC+W3a8q>AO`3n7@L-)+KRb<6Uf!
`D@IXph-Utj*E@g`D5VbS);(D>bHKmr9=rp@9:@_!+'9KrM5!h"1Nhah?hjrL33dYs&3"Fok
RpMVY>uOnXRP+A[UB40oa`P'M.WjtGcAmnnH'PI1^h31Tl2sp^!1S:a6-R.=.fT[M<_GpWi9
+4GgNP3c6k,;`ml4b5k"]Ad5nCfO90'`Q=+kjgj@&?e_U3*u6;Ks9D!]AFL';)c+r2.46<`JBE
u]AtW0R?N"pM?UlcX5Sne04.mW`&B_"+eh:ib=hX;-*ksS=Nt[KQ9b%/^:mUP%W:6Z^?kBRPd
lp,of/.<bcCPoX7cQYS?pY'?"3)SuSu<sHJ_r-NG\:Qs\M9fLNIs_e6NY!`khBA=)3@9pR/*
m?Lf`]A!dSh4lH.tFGe.$O,eo>M>X]AX2PM^<e=DK2b@'L^B`5&=&j<KebVD?#trc'cb.$%dm!
ooM^3grr%:GJFor#8/gRcBZ1a/c>]AP*nEY8`+WM^!gfQ`Kmnt9VN/c>P8$lqYJ^X4dQr84,+
)n"3,HBDP-CGIFjQ0%aF]AJ:d<BjP(2!lK]AH'g'^G?>0+5UpG'BDb+2]ApDo@HCqA)HAO=8A$W
uRdR6qW)PtHA:m3.QG!(@ImR5]A6J-Nio>%u@blPi>?kF9o"Zo&fK1*8uB'(ebQA!s0G_,66Q
0+_AN@\g3j\dm)k]AU/3C0:3'!WOhgWKg'an1e(q2MJj\Bf_pUs%gYX^]A5eBgit)oV=="8O_)
#c4"Unl=-HPKD_-9u753V^Kj.R#X]A?q]ANLr#W7SI=(MgC,]AES"<p=u;`cIff307uNhuVful)
Ts<^b>-M]A<^2H#[3INo93INo93INo93INo93W4FS?%K;@3Os+BpBc^9]AIDG'Yf:sT`>aEtWq
/C&e]AY_O>YK(nY$SfoG]AE?RNU"IjSCMs>V_4l"V_4l"V_4l"VuGRE/_*DP3=J$fJp+.Sqj?]A
sU;Q/tr>,~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="4" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="false"/>
<MobileFormCollapsedStyle class="com.fr.form.ui.mobile.MobileFormCollapsedStyle">
<collapseButton showButton="true" color="-6710887" foldedHint="" unfoldedHint="" defaultState="0"/>
<collapsedWork value="false"/>
<lineAttr number="1"/>
</MobileFormCollapsedStyle>
</InnerWidget>
<BoundsAttr x="0" y="0" width="360" height="250"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
<body class="com.fr.form.ui.ElementCaseEditor">
<WidgetName name="report3"/>
<WidgetID widgetID="3e623f1a-845a-4451-904f-ea950e4b9f8e"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<FormElementCase>
<ReportPageAttr>
<HR/>
<FR/>
<HC/>
<FC/>
</ReportPageAttr>
<ColumnPrivilegeControl/>
<RowPrivilegeControl/>
<RowHeight defaultValue="723900">
<![CDATA[723900,762000,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[3962400,3962400,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="2" s="0">
<O>
<![CDATA[View Item Details]]></O>
<PrivilegeControl/>
<NameJavaScriptGroup>
<NameJavaScript name="Web Report1">
<JavaScript class="com.fr.js.ReportletHyperlink">
<JavaScript class="com.fr.js.ReportletHyperlink">
<Parameters>
<Parameter>
<Attributes name="op"/>
<O>
<![CDATA[view]]></O>
</Parameter>
<Parameter>
<Attributes name="part_number"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$part_number]]></Attributes>
</O>
</Parameter>
</Parameters>
<TargetFrame>
<![CDATA[_dialog]]></TargetFrame>
<Features width="600" height="400"/>
<ReportletName>
<![CDATA[/items/items_view.cpt]]></ReportletName>
<Attr>
<DialogAttr class="com.fr.js.ReportletHyperlinkDialogAttr">
<O>
<![CDATA[Item Details]]></O>
<Location center="true"/>
</DialogAttr>
</Attr>
</JavaScript>
</JavaScript>
</NameJavaScript>
</NameJavaScriptGroup>
<Expand/>
</C>
<C c="0" r="1" cs="2" s="1">
<O t="DSColumn">
<Attributes dsName="ds1" columnName="part_number"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2" showAsDefault="true"/>
<CellPageAttr/>
<Expand dir="0"/>
</C>
<C c="0" r="2" s="2">
<O>
<![CDATA[Stocks on Hand]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="2" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="3" s="2">
<O>
<![CDATA[Remarks]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="3" s="3">
<PrivilegeControl/>
<Expand/>
</C>
<C c="0" r="4" s="2">
<O>
<![CDATA[For Order]]></O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="2"/>
<CellPageAttr/>
<Expand/>
</C>
<C c="1" r="4" s="3">
<PrivilegeControl/>
<Expand/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting>
<PaperSize width="24688800" height="43891200"/>
</PaperSetting>
<Background name="ColorBackground" color="-1"/>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Arial" style="0" size="72" foreground="-16776961" underline="1"/>
<Background name="NullBackground"/>
<Border/>
</Style>
<Style horizontal_alignment="0" imageLayout="1">
<FRFont name="Arial" style="0" size="96"/>
<Background name="ColorBackground" color="-14701083"/>
<Border>
<Top style="1" color="-16777216"/>
<Bottom style="1" color="-16777216"/>
<Left style="1" color="-16777216"/>
<Right style="1" color="-16777216"/>
</Border>
</Style>
<Style imageLayout="1" paddingLeft="5">
<FRFont name="Arial" style="0" size="72"/>
<Background name="ColorBackground" color="-6697729"/>
<Border>
<Top style="1" color="-16777216"/>
<Bottom style="1" color="-16777216"/>
<Left style="1" color="-16777216"/>
<Right style="1" color="-16777216"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="Arial" style="0" size="72"/>
<Background name="NullBackground"/>
<Border>
<Top style="1"/>
<Bottom style="1"/>
<Left style="1"/>
<Right style="1"/>
</Border>
</Style>
</StyleList>
<heightRestrict heightrestrict="false"/>
<heightPercent heightpercent="0.75"/>
<IM>
<![CDATA[m8n"(;X)r6E@.S4A'@NF;9YJNbUlaL'm1EH1D=T6'Q#<U=u7$p5bVeY/@B;7a+_`SeC8L`&M
u:41SI4U<1lWI5p/Q`7GoJ]AY5`nE?e>1(Hp@8n4Qgq6F._Xp/bcgC#P$7<DUWe0!'nSO^ZT#
*5RRhtI'r@rQ(!uF]AGEX1!2EiVSpQL;jU%?UmKFg*T1Q\>VKIt"e9rt?i7_3"fA3t1qnA[br
Q]A!PG[4so/eFbhkNbh0\!tutp%>mKPJh7oDHRiUE[+K6n+BbRN65f:%)Fnr(fXUmX)lfgkii
/JUN\UC:$!`Y0<J[4..GcF=G7?n^V<#3=ta<a<>PYFo=u?'R:*&JIr]AnA@[/ui%Y?QrT&=8X
hZEnoCc*:b>c5J=")";LQ]A!NiGc\THKS"B<I_'oRj)Knt3I0QTX!T:-mr*8n]A,Vp1We/"\H_
O^0N)p?7Xjj5UL7t9[ak]ASo@DUloC9Yr/]ARb_n"[*Gh?"*qk-;\T[%),,QIfTOoK_QKX+$6=
l3Jl:a/rh?OI5m^DothFO<H(mEo$ma<7<Sf]AOo$ALZrQn!G0/QN2nrdUHXNas"ij`XSL$_4G
4HNK`'@PB1I(X]ACV@I=SFd-VKUu%C?]A#i9!HgF#^#*1#B?lLlYid]Akd4e'Z-EV(c?:QC!@G>
`)`mu.,T6".eM7ZM'k[6.*,dL%>qHaQ6-DRcn6^?>^-mL+WDW4nJ9$9S)IWjjRXG.,G7csRe
Gq7g*ZIAouXmV1=qrm3h_^#l\H/V-P,7""egmUeYQtn"&kQT(GK$q5%.2+]AdA\(oBnCb553F
WMI4>!ljo<$1N,&PalEr(N=%,9er&+(E7QZmX2)nuoHGQ1VnP<]AF]A^#j^<Mf:NILbsfe;Q@>
D:$Q8#*_V#Tk$sgeE*2JCXgim,6p]A"Z8%EXY;'%L&jHemQ]A>@CfCi`a/$lU#IVbX5,:830DO
bPjR9VdU34V]A5%U]A_^?`aAZeE$WV&$nBpH6Au%>PEgY-gIkEWEu6C!9b*!Nr29-1H_+9BNG6
X<MXR=1ro6h)*_Ue!Si^8(\0is0;Pp"X'.S(n(5;K#g<OQ9nYT5hX!g&BoTK\B7>Vcr934]AD
i;GB"n-K>0!Kf8]AP#XUMS+EcjMZ`^:jmMd*!0r0iGd_AU01TkG7o`m]ACYW-RF6bLtPbSBtfL
s&iX&VG_o!f->V$K7^iC+hWX1%l!KI8j_".bTe&COjO)Fhf$r:I3$>G2hAjhpu9IDp%V'@j^
<<J#UU9H+DY_*MLR3t<8k?_##)+L1$tHdn]A`CQpJNSUZ%V$-W)Pi*,*uQZ6;WmH($m-_d",o
U;fXrjs-+nFjLen==:[9W6lMXj2,a+B!BO[]A5qZ"JpC>LZ`Go$,tr\;6ki]AQF-B[<]AQe!'O'
i?W[)0t=`;R/d^u'kLGd<.rm\3Z#4jdCEY(h*2K3.$"+)[CZVEs(e]Ak3+3#RFBWs_#1R<)L`
lVKJ?eZWAus4rGV?fcC4]A;DUmJ6"nH4o&0kC<(dk,^#J>_k`=a>.udso\*EtJkK7#90s>Ns$
j!1(DKh*<D1H@0U+6h@WeiJ/UW!<bW)rGe4A/8`W.[?qp6V/TO6:b&nH5UTpd(boN,:!^e0i
&h2$Z^Zs@X4`rSmX6K0CQ+UFDg@W7Gb5A+KAONTpSLmb)[YaBo6N%N4<4H_(0!1a$MI4&^JH
3_p#/5!!ooR?0-]Ac\UP+Ch`b7KAjUa:6TOd#[;XQd,I'q.;5",O*glNG\T^!iIgnbY:l-#k)
uG/j13_=<q`FZQj=lm9l;*5pmcb*Lo.oZ<V@^:bga5DS5g?5djG$cS6)U^u*(<fA##0#CgH2
NVktD4lL3nn<uY%WD9DEIBNt18TN!hE`ee_C'dsc8^`chEC>"a&-F9f:`m=eL*&Z?H$Qn_Ge
3)S-(7&+5%YG1qf\06LE[n/0**(n&+8b/A;%OQ]A[al&C,Xd<#sZ8A((CQI5IlYs#WO+Qra9K
se9H12X+2Tq-s8,JAJ^';7du:eL5FY-R[l"kQii!<GU)p)?Zcn-BjpTp^1+b#5\E%2fJ^%\P
b<[aP]AIcqgka"j$C+)@""i6c7+1N!VF]AdrFc(Qjoeti8>?'AK'bnhlSlPc)^.MX;HhSU,3o&
EfkXW93Q'=b=82GV)OC#0\$9TGM7]ABE9EJu7(hm&AlR"Xoj9hFCpX*'=l8b'"%'lPb!_3tHK
;*/e>cG0NO>`S:hbF1ll`iIt+\9[\+j2ph9_mKm"`EL!n?BFNhl'_OJpND&E7d"5hN581p8H
u;tT?%<GfERe$YZP"K!%G+*Mht.qr#M,7B'NZm\R01h'/M&KNSEpL7al)LFKs$TD!m=CK_\3
6g84)^fh^a:OtO;slS%dd#ZHr(j&IFcj^kY@Fuc`m7lT#h`l9'=?ae0,Kou<B_6e0Dcb;=Ur
YDQY:Xha9g8Jq9'Njq_rJ\QV*6H<i$1kj)0FTe.bq8eZQ,prP''fD+3+:r>)lpTfY-J.!YJq
M=]Aa5>,qPths]AaNr$l1)#2:1gNm!cqeR/!ZRK%8O'4U3a=<*Ks^l-JUV<Th.1,i[_qHF3o?+
m8rab\PIuYYoNS^]AFVCfQVfWgj5k1c#u=NPaOW<N?rM+$d'#um@Xdg\3K+nc-<7uI1-:;8Xe
7M#nrkYu`n.O4+ra3['5FGodBpaUr<b=.H<a3MoFgYAQfHSCkGiG9O8fkr0@TE2N:im^VIeQ
SnUPEP[X\iaa6Q5oJ:Q8K?[-\UjCRIG<WG&6Nr.KYN?2fsVMX3>@r_L*=g>cENKs>8IeP_A#
8(!ZIe_'Tb.^I%Zh10)O7]AEaa:;4kR1h7UD%sml.PT*Cm<?%7JmC_e\Gn\b==LP,;">13\n`
.#1Omo8&(0WOB-GKWHC#qI5r\0j=oeHs.l`5+Ze7;gSP/`HfTU4pmX.p_Q$'rDPu^[X-'m8V
2(Nk#2pSME/sX7NS&_[e(S?r3qWO>6IDVK2(Qfl;WF1bPeG:)MZ?\n=-.)W8>X2ZJTjIL6"C
2o\NiZg5"C``mD5qC8Z&@VS?qUlsW$osghd$T%V/lV.;^7hZhEj<8G8>6EW^$P^*Z>O)CXKI
5o]AWanf\8]AO[[l-&$U8?J[Qi[3<N6de5'8?P>LCKVA'+(;F8%]AEr=jW8n^\_"%Q2%L4$e[Ip
SL;B72i%Z`pH)?Jl6:co&MkBr?b6=nhe\Z]Aij9'lRM6@F=OuP4jSDjEY>'N6rQ\+=iU$PqM?
H!U85PMmj+(CKB<r0V7?bf=.CT28,DA%_]AH0G[Ve(CLXp9JKc)]A1@#t7EEopk-GFf"'6;:D:
l67W%.Y_MSB7j-"[V'QdS;5BS%F(6%Wl%h7rTi9/Fj4>XBu3O2WqIPk$AC%EBn%RoR9[-K6P
,_0Z(M?T\8T\@Mr$jCb-6!EU.h/6I#C*a\c8S\&qZh^4TTXIaQ-a)7>D:9Io7K:!+H#FQd79
_BdKLY"RJiuejii_mA\Ln:;!QX\(>&j<RcOV's6)%c,Nuh.b@LUmTS.<N9t:k$]A&\WSTiI>O
C"u^AD!O*,XE-Tq?WD\<nX-%2ft6:M"3B[(gc*nT0@I>7"-Yk"a!(&Pie4FBQ*7)f<G2.Za^
Gs&Wsc85bpM$hU"&`O)#$B:eYuW]AeH?CLZRqP.=,0'ZO4Zd#^oY(K,Q=teO-b5,o#6#&ir\(
-s_+N.>cr`%aJ>FJj_XiosRZHh?dL_Bob!kLXi%Z4P8tN,9-WUVMVg+QL>Z\?B#rF-8WP>U1
3K8&E]Ar=="G@6?9&r$[Y/%]A;"6N\MR05">,g@B[,>1=H/WpC.^Ft,j]AQFU?qWT$AmR(9T]A'F
q#@&.H)A5]AWqc#qX-;CM!(L2a6*ut=AQl,i8nS7-<rgSjG,@05`roXWmQ0R)*m)++`Q'X=,m
4N_V10"Wl#T#DjQ@Aa\5obBgO=<[ET&^qrRhFTmffF<0a(7<qo#<:?9>9^$L,/,G-Ol*K.Zl
@qggPIOk2JB^46O>4FB'92A^r&M?T]ALsaYjg9"88Clq/I<9bf7&8..[@<0C\(RjmG%P)jDPa
rgR!Q!k3kQSdJ[;aB7Er5tFf?a6jY.[i4_e>59fb6=HAP=omA6rf8`%"K1F*_j`P&CEe&K"s
B+A8KZf#/Zb;BR$pmZ#0FOjA@&hO(!Ge##<j']A,'ma(ik^N,K57;G,XO!aY"oIV)j[+>#1Yb
"<SJJX)\K:sjU7Ql+DjsSE$t:nl7BiCj6d:<3/UH%m$p59H1(K-V;$D6L-t2UT$)[,NUh(Ti
O"FcFINm0LI:eB@H/S/i\VCj2:O;n:5,c=5@XO*8hqWP+a?4ZH!DurY2MY&H#\82ZTQ]A1!!6
g:)R:p@a^mu=7u0_`_V+,,?jrh,fgjHGjC!e=X))<)dmEE'NM!E*<8o_n]AB*ZrdpbD/8k#)R
6\9p(hB2;B\4QTj)!bE"B[kq&pVJ<%i_0s,l(a@p5BPp'Nu5=!YdC(e%ha,6W;:HU[AQM9TU
s.NnH@Nf%n%p+K,S1A#Q0A3KLpF,OS%8X^8/]A5&Hoi'N`RFB0:\<G(=X",WAVbnL=E&D22!J
JBFBYM_9[!U>;%C,nE@P@cr1uVe[<m$"b!lh_a#WND(m-N!j5Tr*Q&U.[PSrKG?Za$NpKqea
bS).*Lb,"T/>,>VA>rf\5tORV3?PAB,AEC_PHcVO'cOj.9rCBTO7i!ETsa[0B*o`;WB*.ne-
IJ-GH5@r8Z]A]AEj_Q03=hp$9Yu,&7')8p&&VJC!Oi]AFA1^<pK@k]AQ.+Rh>;iOp:$77>DJ+*TG
fj'N8O&,L=:Z)lM+[<CFD?Z`\UOCRp"3G=eK,g\o)B/Ts1=JF=T0h&A(,lr6bco9C/*P7,BY
WEieDsT<D6S8R5r(5N./*U6S=QdB.;3;s"6n;.dIi5Yb&kiqCc]Ar8m[F\8YK)[dmS9'J!7s0
u8%=nWftGkVb&R4_HBSsngh3Y,hG(YirFTKU9oVXLL*U`#27e_s:I*Eh^$j:/QVC%]AX;fJ'U
8\lVi,`@W`I=&oB<ASa9g)RD>\D0\ZU21bd]A]A8>X:WTo`;_<L>D`+Arn2Oe`%U\&f_>%h^#!
%1/,qG&gN1!#jAm*D1\(Fes5OLd4Y<a/8Rt]A#lPrS[_HS=!bG3cl+7>Q(KsRdr%e;6m`P51.
US-'V>0D%(`XNCCNVSAF#B79eqj\<(]A_ZSZfF2MfoI=a&#`:VA8+8RtfPgbtbO``k3.KUDZk
&rd`c\0>hja4upEusdpd).J(;5$D<6V<b:4rZ_q5a,:N1:JNQsFHWj%ib`V%SOK@SqQ7Rs(b
_a0\glVPW66q7+$^\XmfsX%[$)I38',!34aU%r/lYq+E@_!a@^B;PKMH.[-p?.0XkKXYcKa;
=^p!&Yn+*YUiP&0OIH(khs8[Z-la._=bFjd4"#,(V+VsO1,('U5"e_[&mRb@$0G"\h@$nMp-
U+mV=UoZ2"&WCDO5iq'2_8<"NR/->EFH8BNcLJcOXuqA>3\#k3ma%[UVoq]A#mJ$hK,L%.%)0
#Q'2/]AF]Ak>EK1B8bRD'5b-jRD#]A'sV5>P5S=--_!O5I]ApO7aN2L8l6RkA84Wf#I''"T+t1Yl
e=77guf_0K<B_03T/+XkPZTaC#]AB?c<389,p(+HcKc2=sYJX8i36-Xq$U(V'c4i$S:"9"1BP
7T'J?iPY.aH5!prl(HOW*o=D.`EKeWW"Q%4mX#+flNV_r)cVt>J!N7\ILccD.-%u#Y@:4i<a
-3\o$7VUcF-#T>3utTG_bJL%_q\qj@C&%ba,ruCTTBdQ,1I]AIW*Z/eC*iim)E0\8ftHIHIp;
ds?gF5:FZ5rZQ/&-?X&i\D+B;K&I::5``rb]ArL8AABEH^[Pp_=/OG&EGJR)"T/-=+os#'4W'
R;a<%fbM#D9>b$[r.M",p(W70U-m*k[UQ.hAF1I>e,S$mq3MBTQ\sS5dU!%Ok:`U#AH;c2ec
<`k!!(pA!WdgYDJ>tj^ooDu!.aOIJ,k+8hb,fX2f<=3!1Q,/;`MSR$hOi!$hOi!$hOi!$hOi
!$hXH^FNIWC]A9*'bd+'Dd'u5/L`3]A<le%bnn~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="1" vertical="1" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="false"/>
<MobileFormCollapsedStyle class="com.fr.form.ui.mobile.MobileFormCollapsedStyle">
<collapseButton showButton="true" color="-6710887" foldedHint="" unfoldedHint="" defaultState="0"/>
<collapsedWork value="false"/>
<lineAttr number="1"/>
</MobileFormCollapsedStyle>
</body>
</InnerWidget>
<BoundsAttr x="0" y="0" width="360" height="250"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WAbsoluteLayout">
<WidgetName name="absolute0"/>
<WidgetID widgetID="0915df26-b845-458f-a8a4-72b00c92d808"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" color="-723724" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<ShowBookmarks showBookmarks="false"/>
<Sorted sorted="false"/>
<MobileWidgetList/>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.DefaultMobileBookMarkStyle"/>
<WidgetScalingAttr compState="0"/>
<DesignResolution absoluteResolutionScaleW="1920" absoluteResolutionScaleH="1080"/>
</InnerWidget>
<BoundsAttr x="0" y="270" width="360" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="item_id"/>
<WidgetID widgetID="180fc108-c3a2-4356-b6e4-33e7eafb10b2"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<databinding>
<![CDATA[{Name:ds1,Key:id}]]></databinding>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0" color="-723724"/>
</InnerWidget>
<BoundsAttr x="0" y="250" width="360" height="20"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="afterinit" name="After Initialization1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var item = this.options.form.getWidgetByName("item_id").getValue()
if(item == '' || item == null){
	this.setVisible(false);
}]]></Content>
</JavaScript>
</Listener>
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="item_id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$item_id]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="transaction_type"/>
<O t="I">
<![CDATA[1]]></O>
</Parameter>
</Parameters>
<Content>
<![CDATA[FR.mobilePopup({
	target: "template",
	parameters: {
		'item_id':item_id,
		'transaction_type':transaction_type
		},
	setting: {
		templatePath: "/transactions/transact.frm",     
		border: {
			type: 0,
			color: "rgb(0,0,0)",
			borderRadius: 4.0
		},
		background: {
			color: "rgb(255,255,255)"
		},
		mobileRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		},
		padRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		}
	}
});]]></Content>
</JavaScript>
</Listener>
<WidgetName name="button1"/>
<WidgetID widgetID="f39a5b2a-88cb-488e-ae7b-fada117819b6"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="button1" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[ISSUANCE]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="180" y="291" width="180" height="242"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="afterinit" name="After Initialization1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var item = this.options.form.getWidgetByName("item_id").getValue()
if(item == '' || item == null){
	this.setVisible(false);
}
]]></Content>
</JavaScript>
</Listener>
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="item_id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$item_id]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="transaction_type"/>
<O t="I">
<![CDATA[2]]></O>
</Parameter>
</Parameters>
<Content>
<![CDATA[FR.mobilePopup({
	target: "template",
	parameters: {
		'item_id':item_id,
		'transaction_type':transaction_type
		},
	setting: {
		templatePath: "/transactions/transact.frm",     
		border: {
			type: 0,
			color: "rgb(0,0,0)",
			borderRadius: 4.0
		},
		background: {
			color: "rgb(255,255,255)"
		},
		mobileRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		},
		padRegular: {
			type: "custom" || "auto_height",
			heightPercent: 95.0,
			widthPercent: 95.0
		}
	}
});]]></Content>
</JavaScript>
</Listener>
<WidgetName name="button0"/>
<WidgetID widgetID="7f085e33-abf1-4a9d-a8ea-798c6a41aed7"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="button0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[RECEIVING]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="0" y="291" width="180" height="242"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
<Sorted sorted="true"/>
<MobileWidgetList>
<Widget widgetName="button1"/>
<Widget widgetName="button0"/>
<Widget widgetName="item_id"/>
<Widget widgetName="report3"/>
<Widget widgetName="absolute0"/>
</MobileWidgetList>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.SidebarMobileBookMarkStyle">
<SidebarMobileBookMarkStyle width="80" height="38" gap="5" borderRadius="2" backgroundColor="-6645094" opacity="50" borderLineStyle="0" borderColor="0" fontFamily="SimSun" fontSize="12" fontColor="-1" fontItalic="false" fontBold="false" selectedBackgroundColor="-14701083" selectedOpacity="85" selectedBorderLineStyle="0" selectedBorderColor="0" selectedFontFamily="SimSun" selectedFontSize="12" selectedFontColor="-1" selectedFontItalic="false" selectedFontBold="false"/>
</MobileBookMarkStyle>
<WidgetZoomAttr compState="1"/>
<AppRelayout appRelayout="false"/>
<Size width="360" height="533"/>
<ResolutionScalingAttr percent="1.2"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="KAA"/>
<PreviewType PreviewType="4"/>
<WatermarkAttr class="com.fr.base.iofile.attr.WatermarkAttr">
<WatermarkAttr fontSize="20" color="-6710887" horizontalGap="200" verticalGap="100" valid="false">
<Text>
<![CDATA[]]></Text>
</WatermarkAttr>
</WatermarkAttr>
<MobileOnlyTemplateAttrMark class="com.fr.base.iofile.attr.MobileOnlyTemplateAttrMark"/>
<TemplateCloudInfoAttrMark class="com.fr.plugin.cloud.analytics.attr.TemplateInfoAttrMark" pluginID="com.fr.plugin.cloud.analytics.v10" plugin-version="2.7.0.20220615">
<TemplateCloudInfoAttrMark createTime="1654737219260"/>
</TemplateCloudInfoAttrMark>
<TemplateIdAttMark class="com.fr.base.iofile.attr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="0fbdc9fd-670c-4e9e-b9a3-5f02664ce203"/>
</TemplateIdAttMark>
</Form>
