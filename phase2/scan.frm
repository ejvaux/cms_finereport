<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20211223" releaseVersion="11.0.0">
<TableDataMap>
<TableData name="hierarchy" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="state_type_parent_id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("transaction_details","current_process_id")]]></Attributes>
</O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT 
	wsh.id, 
	wsh.state_type_child_id,
	wst.type_key

FROM [dbo]A.[workflow_state_hierarchy]A wsh

inner join dbo.workflow_state_type wst
on wsh.state_type_child_id = wst.id

where state_type_parent_id = '${state_type_parent_id}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="option" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="context_state_id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("transaction_details","transaction_type_id")]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="outcome_id"/>
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
<![CDATA[SELECT 
		wso.id,
		wso.state_context_id,
		--wstct.type_key as context_state,
		--wsc.state_type_id as context_state_id,
		wsc.state_hierarchy_id,
		--wstp.type_key as parent_state,
		--wsh.state_type_parent_id,
		--wstc.type_key as child_state,
		--wsh.state_type_child_id,
		--wsc.child_disabled,
		wst.type_key as next_state_type_name,
		wso.state_type_id as next_state_type_id

  FROM [cms_dev]A.[dbo]A.[workflow_state_option]A wso

  left outer join [cms_dev]A.[dbo]A.[workflow_state_context]A wsc
  on wsc.id = wso.state_context_id

  left outer join [cms_dev]A.[dbo]A.[workflow_state_hierarchy]A wsh
  on wsh.id = wsc.state_hierarchy_id

  left outer join [cms_dev]A.[dbo]A.[workflow_state_type]A wst
  on wst.id = wso.state_type_id

--  left outer join [cms_dev]A.[dbo]A.[workflow_state_type]A wstp
--  on wstp.id = wsh.state_type_parent_id

--  left outer join [cms_dev]A.[dbo]A.[workflow_state_type]A wstc
--  on wstc.id = wsh.state_type_child_id

--  left outer join [cms_dev]A.[dbo]A.[workflow_state_type]A wstct
--  on wstct.id = wsc.state_type_id

  where wsc.state_type_id = '${context_state_id}'
  and wsc.state_hierarchy_id = '${outcome_id}'
  --and wsc.state_hierarchy_id IN (9,10)]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="transaction_details" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="transaction_number"/>
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
<![CDATA[SELECT 
	t.id,
	t.transaction_number,
	r.name as requestor,
	l.name as location,
	s.name as station,
	--sh.name as shift,
	--t.updated_by,
	th2.id as transaction_history_id,
	th2.state as current_process,
	th2.wf_state_type_state_id as current_process_id,
	d.name as department,
	si.name as site,
	wst.type_key as transaction_type,
	--t.updated_at,
	t.created_at,
	t.transaction_type_id,
	--t.site_id,
	--t.department_id,
	t.requested_by

FROM [dbo]A.[transactions]A t

left outer join locations l
on l.id = t.location_id

left outer join requestors r
on r.id = t.requested_by

left outer join stations s
on s.id = t.station_id

left outer join shifts sh
on sh.id = t.shift_id

left outer join departments d
on d.id = t.department_id

left outer join sites si
on si.id = t.site_id

left outer join workflow_state_type wst
on wst.id = t.transaction_type_id

CROSS APPLY
(
SELECT top 1
	th.*,
	wst_s.type_key as state
	
FROM [dbo]A.[transaction_history]A th

left outer join workflow_state_type wst_s
on wst_s.id = th.wf_state_type_state_id
where th.transaction_id = t.id
order by th.id desc
) th2

where t.transaction_number LIKE '%'+'${transaction_number}'
and th2.wf_state_type_state_id = '8']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
<TableData name="requestors" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="qrcode"/>
<O>
<![CDATA[]]></O>
</Parameter>
<Parameter>
<Attributes name="rid"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("transaction_details","requested_by")]]></Attributes>
</O>
</Parameter>
</Parameters>
<Attributes maxMemRowCount="-1"/>
<Connection class="com.fr.data.impl.NameDatabaseConnection">
<DatabaseName>
<![CDATA[cms_dev]]></DatabaseName>
</Connection>
<Query>
<![CDATA[SELECT * FROM [dbo]A.[requestors]A
where code = '${qrcode}'
and id = '${rid}']]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
</TableDataMap>
<FormMobileAttr>
<FormMobileAttr refresh="false" isUseHTML="false" isMobileOnly="true" isAdaptivePropertyAutoMatch="true" appearRefresh="true" promptWhenLeaveWithoutSubmit="false" allowDoubleClickOrZoom="false"/>
</FormMobileAttr>
<Parameters/>
<Layout class="com.fr.form.ui.container.WBorderLayout">
<WidgetName name="form"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="form" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
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
<NorthAttr/>
<North class="com.fr.form.ui.container.WParameterLayout">
<WidgetName name="para"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Alpha alpha="1.0"/>
</Border>
<Background name="ColorBackground"/>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.parameter.FormSubmitButton">
<WidgetName name="Search"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="Search" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[Query]]></Text>
<Hotkeys>
<![CDATA[enter]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="94" y="14" width="80" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.TextEditor">
<WidgetName name="transaction_number"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="transaction_number" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<allowBlank>
<![CDATA[false]]></allowBlank>
<TextAttr allowBlank="false"/>
<Reg class="com.fr.form.ui.reg.NoneReg"/>
<watermark>
<![CDATA[Enter transaction number]]></watermark>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
<MobileScanCodeAttr scanCode="false" textInputMode="1" isSupportManual="true" isSupportScan="false" isSupportNFC="false"/>
</InnerWidget>
<BoundsAttr x="14" y="14" width="80" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
<Sorted sorted="true"/>
<MobileWidgetList>
<Widget widgetName="transaction_number"/>
<Widget widgetName="Search"/>
</MobileWidgetList>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.DefaultMobileBookMarkStyle"/>
<Display display="true"/>
<DelayDisplayContent delay="true"/>
<UseParamsTemplate use="true"/>
<paramFireStopEdit fireEvent="false"/>
<Position position="0"/>
<Design_Width design_width="375"/>
<NameTagModified/>
<WidgetNameTagMap/>
<ParamAttr class="com.fr.report.mobile.DefaultMobileParamStyle"/>
<ParamStyle class="com.fr.form.ui.mobile.impl.DefaultMobileParameterStyle"/>
</North>
<Center class="com.fr.form.ui.container.WFitLayout">
<Listener event="afterinit" name="After Initialization1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="id"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=value("transaction_details","current_process_id")]]></Attributes>
</O>
</Parameter>
</Parameters>
<Content>
<![CDATA[var report = this.options.form.getWidgetByName('report0');
var outcome = this.options.form.getWidgetByName('outcome_id');
var process = this.options.form.getWidgetByName('process_id');
var qr = this.options.form.getWidgetByName('qrcode');
var view = this.options.form.getWidgetByName('viewItemBtn');
var history = this.options.form.getWidgetByName('historyBtn');
function hide_el() {
	report.setVisible(false);
	outcome.setVisible(false);
	process.setVisible(false);
	qr.setVisible(false);
	view.setVisible(false);
	history.setVisible(false);
}

function show_el() {
	report.setVisible(true);
	outcome.setVisible(true);
	process.setVisible(true);
	qr.setVisible(true);
	view.setVisible(true);
}

if (id != "8") {
	hide_el();
	FR.Msg.alert("Warning", "Transaction not found or not for receiving. Closing window.", function() {
		window.close();
	});
}]]></Content>
</JavaScript>
</Listener>
<WidgetName name="body"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="Arial" style="0" size="72"/>
<Position pos="0"/>
</WidgetTitle>
<Background name="ColorBackground">
<color>
<FineColor color="-1" hor="-1" ver="-1"/>
</color>
</Background>
<Alpha alpha="1.0"/>
</Border>
<appFormBodyPadding class="com.fr.base.iofile.attr.FormBodyPaddingAttrMark">
<appFormBodyPadding interval="1">
<Margin top="4" left="4" bottom="4" right="4"/>
</appFormBodyPadding>
</appFormBodyPadding>
<LCAttr vgap="0" hgap="0" compInterval="0"/>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="tid"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("transaction_details","id")]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="path"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$cmspath]]></Attributes>
</O>
</Parameter>
</Parameters>
<Content>
<![CDATA[FR.mobilePopup({
	target: "template",
	parameters: {
		'transaction_id':tid,
		},
	setting: {
		templatePath: path + "/transaction_history.cpt",     
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
<WidgetName name="historyBtn"/>
<WidgetID widgetID="91bfbf67-5ace-430a-aa4f-03b031d17e61"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[Transaction History]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="0" y="251" width="375" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WScaleLayout">
<WidgetName name="process_id"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
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
<InnerWidget class="com.fr.form.ui.ComboBox">
<WidgetName name="process_id"/>
<WidgetID widgetID="ce618566-e9c9-4d13-a1e1-943119615db1"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
<MobileStyle class="com.fr.form.ui.mobile.combo.SimpleComboStyle" isCustom="false" borderType="1" borderRadius="2.0">
<ExtraAttr isCustom="true" expandIcon="" unexpandIcon="">
<LabelFont>
<FRFont name="Arial" style="0" size="120"/>
</LabelFont>
<ValueFont>
<FRFont name="Arial" style="0" size="120">
<foreground>
<FineColor color="-6710887" hor="-1" ver="-1"/>
</foreground>
</FRFont>
</ValueFont>
<controlStyle borderType="1" borderRadius="2.0" isCustomWidth="false" isFloatWidthFollow="false">
<borderColor>
<FineColor color="-12999178" hor="0" ver="0"/>
</borderColor>
</controlStyle>
</ExtraAttr>
<Background name="ColorBackground"/>
<FRFont name="SimSun" style="0" size="128"/>
<iconColor>
<FineColor color="-14701083" hor="-1" ver="-1"/>
</iconColor>
</MobileStyle>
</WidgetAttr>
<allowBlank>
<![CDATA[false]]></allowBlank>
<DirectEdit>
<![CDATA[false]]></DirectEdit>
<CustomData>
<![CDATA[false]]></CustomData>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="next_state_type_id" viName="next_state_type_name"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[option]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<databinding>
<![CDATA[{Name:option,Key:next_state_type_id}]]></databinding>
</widgetValue>
</InnerWidget>
<BoundsAttr x="0" y="376" width="375" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="0" y="376" width="375" height="38"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label0"/>
<WidgetID widgetID="7b85dc01-1df9-401b-bdce-3dc198ea7fed"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
<LabelAttr verticalcenter="true" textalign="0" autoline="true"/>
<FRFont name="SimSun" style="0" size="72"/>
<border style="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
</InnerWidget>
<BoundsAttr x="0" y="272" width="375" height="22"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.RadioGroup">
<WidgetName name="outcome_id"/>
<WidgetID widgetID="9edc0db5-4c2d-48c0-a1e8-b154bcc20a11"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="radioGroup0" frozen="false"/>
<PrivilegeControl/>
<MobileStyle class="com.fr.form.ui.mobile.radiogroup.UnitedMobileStyle" isCustom="false" borderType="1" borderRadius="2.0">
<ExtraAttr isCustom="true" leftPadding="0.0" rightPadding="0.0" topPadding="0.0" bottomPadding="10.0">
<ExtraBackground>
<initialBackgroundColor>
<FineColor color="-1" hor="-1" ver="-1"/>
</initialBackgroundColor>
<selectedBackgroundColor>
<FineColor color="-14701083" hor="-1" ver="-1"/>
</selectedBackgroundColor>
</ExtraBackground>
<ExtraBorder borderType="1" borderRadius="2.0">
<borderColor>
<FineColor color="-14701083" hor="-1" ver="-1"/>
</borderColor>
</ExtraBorder>
<InitialFont>
<FRFont name="Arial" style="0" size="120">
<foreground>
<FineColor color="-14701083" hor="-1" ver="-1"/>
</foreground>
</FRFont>
</InitialFont>
<SelectedFont>
<FRFont name="Arial" style="0" size="120">
<foreground>
<FineColor color="-1" hor="-1" ver="-1"/>
</foreground>
</FRFont>
</SelectedFont>
</ExtraAttr>
<Background name="ColorBackground"/>
<FRFont name="SimSun" style="0" size="128"/>
<iconColor>
<FineColor color="-14701083" hor="-1" ver="-1"/>
</iconColor>
</MobileStyle>
</WidgetAttr>
<EMSG>
<![CDATA[Decision is required!]]></EMSG>
<allowBlank>
<![CDATA[false]]></allowBlank>
<fontSize>
<![CDATA[9]]></fontSize>
<Dictionary class="com.fr.data.impl.TableDataDictionary">
<FormulaDictAttr kiName="id" viName="type_key"/>
<TableDataDictAttr>
<TableData class="com.fr.data.impl.NameTableData">
<Name>
<![CDATA[hierarchy]]></Name>
</TableData>
</TableDataDictAttr>
</Dictionary>
<widgetValue>
<databinding>
<![CDATA[{Name:hierarchy,Key:id}]]></databinding>
</widgetValue>
<MaxRowsMobileAttr maxShowRows="5"/>
</InnerWidget>
<BoundsAttr x="0" y="294" width="375" height="82"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="tid"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("transaction_details","id")]]></Attributes>
</O>
</Parameter>
<Parameter>
<Attributes name="path"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$cmspath]]></Attributes>
</O>
</Parameter>
</Parameters>
<Content>
<![CDATA[FR.mobilePopup({
	target: "template",
	parameters: {
		'transaction_id':tid,
		},
	setting: {
		templatePath: path + "/transaction_items_view.cpt",     
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
<WidgetName name="viewItemBtn"/>
<WidgetID widgetID="a98f5e56-5ec8-43a1-b8f5-a5fb7be1efd0"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="button0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[View Items]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="0" y="228" width="375" height="23"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WScaleLayout">
<WidgetName name="outcome"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="textEditor0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
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
<InnerWidget class="com.fr.form.ui.TextEditor">
<WidgetName name="outcome"/>
<WidgetID widgetID="e0000b02-c102-4bcb-b3b7-a1681e8ed32a"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<TextAttr/>
<Reg class="com.fr.form.ui.reg.NoneReg"/>
<widgetValue>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("hierarchy","state_type_child_id","id",$outcome_id)]]></Attributes>
</O>
</widgetValue>
<MobileScanCodeAttr scanCode="true" textInputMode="0" isSupportManual="true" isSupportScan="true" isSupportNFC="false"/>
</InnerWidget>
<BoundsAttr x="234" y="539" width="141" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="234" y="539" width="141" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WScaleLayout">
<WidgetName name="history_id"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="textEditor0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
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
<InnerWidget class="com.fr.form.ui.TextEditor">
<WidgetName name="history_id"/>
<LabelName name="history_id"/>
<WidgetID widgetID="f04b4019-2439-4cde-8314-03a5ab8c2983"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<TextAttr/>
<Reg class="com.fr.form.ui.reg.NoneReg"/>
<widgetValue>
<databinding>
<![CDATA[{Name:transaction_details,Key:transaction_history_id}]]></databinding>
</widgetValue>
<MobileScanCodeAttr scanCode="true" textInputMode="0" isSupportManual="true" isSupportScan="true" isSupportNFC="false"/>
</InnerWidget>
<BoundsAttr x="94" y="539" width="140" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="94" y="539" width="140" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WScaleLayout">
<WidgetName name="transaction_id"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="textEditor0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
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
<InnerWidget class="com.fr.form.ui.TextEditor">
<WidgetName name="transaction_id"/>
<WidgetID widgetID="2b087003-d05e-4522-8b5d-429968ac612a"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<TextAttr/>
<Reg class="com.fr.form.ui.reg.NoneReg"/>
<widgetValue>
<databinding>
<![CDATA[{Name:transaction_details,Key:id}]]></databinding>
</widgetValue>
<MobileScanCodeAttr scanCode="true" textInputMode="0" isSupportManual="true" isSupportScan="true" isSupportNFC="false"/>
</InnerWidget>
<BoundsAttr x="0" y="539" width="94" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="0" y="539" width="94" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.Commit2DBJavaScript">
<Parameters/>
<Attributes dsName="cms_dev" name="Submit2"/>
<DMLConfig class="com.fr.write.config.UpdateConfig">
<Table schema="" name="transaction_history"/>
<ColumnConfig name="id" isKey="true" skipUnmodified="false">
<O t="XMLable" class="com.fr.stable.js.WidgetName">
<WidetName name="history_id"/>
</O>
</ColumnConfig>
<ColumnConfig name="transaction_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.stable.js.WidgetName">
<WidetName name="transaction_id"/>
</O>
</ColumnConfig>
<ColumnConfig name="remarks" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[="Confirmed: "+$rName]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="wf_state_type_outcome_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.stable.js.WidgetName">
<WidetName name="outcome"/>
</O>
</ColumnConfig>
<ColumnConfig name="agent" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=GetRealName($fine_username)]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="due_date" isKey="false" skipUnmodified="false">
<O>
<![CDATA[]]></O>
</ColumnConfig>
<ColumnConfig name="updated_at" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=NOW()]]></Attributes>
</O>
</ColumnConfig>
<NameSubmitJob name="Submit Event1">
<SubmitJob class="com.fr.write.DMLConfigJob">
<Attributes dsName="cms_dev"/>
<DMLConfig class="com.fr.write.config.UpdateConfig">
<Table schema="" name="transactions"/>
<ColumnConfig name="id" isKey="true" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$transaction_id]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="updated_by" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=GetRealName($fine_username)]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="updated_at" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=NOW()]]></Attributes>
</O>
</ColumnConfig>
<Condition class="com.fr.data.condition.ListCondition"/>
</DMLConfig>
</SubmitJob>
</NameSubmitJob>
<NameSubmitJob name="Submit Event2">
<SubmitJob class="com.fr.write.DMLConfigJob">
<Attributes dsName="cms_dev"/>
<DMLConfig class="com.fr.write.config.InsertConfig">
<Table schema="" name="transaction_history"/>
<ColumnConfig name="transaction_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$transaction_id]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="wf_state_type_state_id" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=$process_id]]></Attributes>
</O>
</ColumnConfig>
<ColumnConfig name="updated_at" isKey="false" skipUnmodified="false">
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=NOW()]]></Attributes>
</O>
</ColumnConfig>
<Condition class="com.fr.data.condition.ListCondition"/>
</DMLConfig>
</SubmitJob>
</NameSubmitJob>
<Condition class="com.fr.data.condition.ListCondition"/>
</DMLConfig>
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[if (fr_submitinfo.success) {
	FR.Msg.alert('Success','Transaction confirmed. Closing window.',function(){window.close()});
	//alert('Closed');
	//window.close();
} else {
	FR.Msg.alert('Saving Failed', fr_submitinfo.failinfo);
}]]></Content>
</JavaScript>
<JavaScriptResourceInfo/>
</JavaScript>
</Listener>
<WidgetName name="submit_btn"/>
<WidgetID widgetID="fb484b89-ecee-4e28-aea0-b4a278c3c94a"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="button0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[Submit]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="0" y="507" width="375" height="32"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WScaleLayout">
<WidgetName name="rName"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="textEditor0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
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
<InnerWidget class="com.fr.form.ui.TextEditor">
<WidgetName name="rName"/>
<WidgetID widgetID="aa8e45c8-3b4d-43f8-80c8-5e3cf94fd021"/>
<WidgetAttr disabled="true" invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<TextAttr/>
<Reg class="com.fr.form.ui.reg.NoneReg"/>
<widgetValue>
<databinding>
<![CDATA[{Name:requestors,Key:name}]]></databinding>
</widgetValue>
<MobileScanCodeAttr scanCode="true" textInputMode="0" isSupportManual="true" isSupportScan="true" isSupportNFC="false"/>
</InnerWidget>
<BoundsAttr x="0" y="465" width="375" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="0" y="465" width="375" height="42"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WScaleLayout">
<WidgetName name="qrcode"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="textEditor0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
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
<InnerWidget class="com.fr.form.ui.TextEditor">
<Listener event="stopedit" name="Edit End1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[this.setVisible(false);
var r = this.options.form.getWidgetByName("rName");
var rv = r.getValue();
var val = this.getValue();
var submit = this.options.form.getWidgetByName("submit_btn");
//alert(rv);
//alert(val);
if (rv == null || rv == "") {
	FR.Msg.alert("Warning", "Wrong QR code.");
	this.reset();
	this.setVisible(true);
} else {
	//this.setVisible(false);
	r.setVisible(true);
	//submit.setVisible(true);
	submit.fireEvent("click");
}]]></Content>
</JavaScript>
</Listener>
<WidgetName name="qrcode"/>
<WidgetID widgetID="07f4e6eb-e381-4ef1-8f57-c23043776d70"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
<MobileStyle class="com.fr.form.ui.mobile.DefaultMobileStyle" isCustom="true" borderType="1" borderRadius="2.0">
<Background name="ColorBackground"/>
<FRFont name="SimSun" style="0" size="128"/>
<borderColor>
<FineColor color="-4332545" hor="-1" ver="-1"/>
</borderColor>
<iconColor>
<FineColor color="-14701083" hor="-1" ver="-1"/>
</iconColor>
</MobileStyle>
</WidgetAttr>
<TextAttr/>
<Reg class="com.fr.form.ui.reg.NoneReg"/>
<watermark>
<![CDATA[Scan Requestor QR Code]]></watermark>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
<MobileScanCodeAttr scanCode="true" textInputMode="2" isSupportManual="false" isSupportScan="true" isSupportNFC="false"/>
</InnerWidget>
<BoundsAttr x="0" y="414" width="375" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="0" y="414" width="375" height="51"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WTitleLayout">
<WidgetName name="report0"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="report0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="0" bottom="0" right="0"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0">
<color>
<FineColor color="-723724" hor="-1" ver="-1"/>
</color>
</border>
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
<WidgetName name="report0"/>
<WidgetID widgetID="abd622a2-2f43-40e5-a39c-c7ffcc1f427f"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<FollowingTheme borderStyle="false"/>
<Margin top="0" left="11" bottom="11" right="11"/>
<Border>
<border style="0" borderRadius="0" type="0" borderStyle="0"/>
<WidgetTitle>
<O>
<![CDATA[New Title]]></O>
<FRFont name="simhei" style="1" size="128"/>
<Position pos="2"/>
<Background name="ColorBackground">
<color>
<FineColor color="-10243346" hor="-1" ver="-1"/>
</color>
</Background>
<BackgroundOpacity opacity="0.04"/>
<InsetImage padding="4" insetRelativeTextLeft="true" insetRelativeTextRight="false" name="ImageBackground" layout="3">
<FineImage fm="png" imageId="__ImageCache__9BDAD1A694F2AE09931BEB5B979DA1F5">
<IM>
<![CDATA[lO<9(kN.ld@UNU%p%320!n&&RXMhpZ,a0ckg]Ag[)Sh?$H'm#O$mX9@nDg03/<C4dC'hs7\:U
CrUFIA*cmN+n1!@hUKFS0]AXkEO<r!!~
]]></IM>
</FineImage>
</InsetImage>
</WidgetTitle>
<Background name="ColorBackground">
<color>
<FineColor color="-10243346" hor="-1" ver="-1"/>
</color>
</Background>
<Alpha alpha="0.04"/>
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
<![CDATA[723900,723900,723900,723900,723900,723900,723900,723900,723900,723900,723900]]></RowHeight>
<ColumnWidth defaultValue="2743200">
<![CDATA[3771900,6591300,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="2" s="0">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="transaction_number"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
<cellSortAttr>
<sortExpressions/>
</cellSortAttr>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<Expand dir="0">
<cellSortAttr/>
</Expand>
</C>
<C c="0" r="1" s="1">
<O>
<![CDATA[Type:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="1" s="2">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="transaction_type"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<Expand dir="0">
<cellSortAttr/>
</Expand>
</C>
<C c="0" r="2" s="1">
<O>
<![CDATA[Requested by:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="2" s="2">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="requestor"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
<cellSortAttr>
<sortExpressions/>
</cellSortAttr>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<Expand dir="0">
<cellSortAttr/>
</Expand>
</C>
<C c="0" r="3" s="1">
<O>
<![CDATA[Shift:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="current_process"/>
<Condition class="com.fr.data.condition.ListCondition"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper">
<Attr divideMode="1"/>
</RG>
<Result>
<![CDATA[$$$]]></Result>
<Parameters/>
<cellSortAttr>
<sortExpressions/>
</cellSortAttr>
</O>
<PrivilegeControl/>
<CellGUIAttr adjustmode="0"/>
<Expand dir="0">
<cellSortAttr/>
</Expand>
</C>
<C c="0" r="4" s="1">
<O>
<![CDATA[Site:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="3">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="site"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="5" s="1">
<O>
<![CDATA[Department:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="5" s="3">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="department"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="6" s="1">
<O>
<![CDATA[Location:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="6" s="3">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="location"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="7" s="1">
<O>
<![CDATA[Station:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="7" s="3">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="station"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="8" s="1">
<O>
<![CDATA[Created at:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="8" s="3">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="created_at"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="9" s="1">
<O>
<![CDATA[Current Process:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="9" s="3">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="current_process"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
</CellElementList>
<ReportAttrSet>
<ReportSettings headerHeight="0" footerHeight="0">
<PaperSetting>
<PaperSize width="24688800" height="43891200"/>
</PaperSetting>
<FollowingTheme background="true"/>
<Background name="ColorBackground">
<color>
<FineColor color="-1" hor="-1" ver="-1"/>
</color>
</Background>
</ReportSettings>
</ReportAttrSet>
</FormElementCase>
<StyleList>
<Style horizontal_alignment="0" imageLayout="1" lineSpacing="2">
<FRFont name="simhei" style="0" size="96"/>
<Background name="ColorBackground">
<color>
<FineColor color="-14701083" hor="-1" ver="-1"/>
</color>
</Background>
<Border>
<Top style="1"/>
<Bottom style="1"/>
<Left style="1"/>
<Right style="1"/>
</Border>
</Style>
<Style horizontal_alignment="4" imageLayout="1">
<FRFont name="simhei" style="0" size="72"/>
<Background name="ColorBackground">
<color>
<FineColor color="-4332545" hor="-1" ver="-1"/>
</color>
</Background>
<Border>
<Top style="1"/>
<Bottom style="1"/>
<Left style="1"/>
<Right style="1"/>
</Border>
</Style>
<Style imageLayout="1" paddingLeft="5">
<FRFont name="simhei" style="0" size="72"/>
<Background name="NullBackground"/>
<Border>
<Top style="1"/>
<Bottom style="1"/>
<Left style="1"/>
<Right style="1"/>
</Border>
</Style>
<Style imageLayout="1">
<FRFont name="simhei" style="0" size="72"/>
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
<![CDATA[mC[RH<,9*1N"$$o,2IjF.%mBC1ajMF+sgM).F!BrFGbZ@8N02ad%H%76V,*'0[_\/`.6&cbW
C?_pZ$>?hTn4Nq>C6EroI=d[H<M8^;"Yn[itKFjG=1W$1[NSL_UY8mc38sik`MoToX[AG:2R
Js!/ZB,C)]Aq8I`/)j`+'TMSZY?#;2-92ARc4<?aj=I,ZXjCmr2aG#;.OHB7N#"k2HQA'H!]Aj
)_kE"a/#\0E;M:P1;^Bn;plJ3&U6J$o&;>_HjW.,<_+Qc/:Da4I(We90j?b-e'N%,p\:lZB'
<(22LtM-g5fD%i+C!c:#Llc%k-o2$XcP"ip!:dc2AGH1Zhn>uF-(L:)E"R-9UH,<[E"q=#JX
.K#G"e6(I$*aY,/T1\Ull`WC,a*of&n.)dj+"NDL)\)&#rQ08UDatH\hDKc%9R_<gTBFkC`U
-!dG!R2+3((]AVVcf"_8m4^n%7mT`e#NZ8S@1[.NfC43$Epolh7Vqk:+b>C/n[?]AS@N;F2O5r
S\WYTY<V[q)Gp6nUoAsp@B4[-/*B*]A^X&%3'7W&I8qqm@0.3(NiKgnd`T^L!A$i4*mY:;(bj
1SrbSr9sRgY9qCc^fL5^;$f*'G'hOYM"Ls@q&Hbli?g-7gWZJpJ_8Oq-fas#USZ$)rodRR\C
e>=pZ\Q,TqV9_oq,Bjb/)hl*-B[%7qAdau0JNSc8E<S]A3Glq;N:\m&I<JqV_dC$i=MjVfs!#
bB2Ah]AF:>V#VhWbbZEGhMEgm55\>#ag),UsDCTpQ@+6P+l0diMmE[DX@W-C2KE<ago*5*%.s
:`QdG"[G6-hDO,JMAk;D_lI)@oZ4LQR3XkM/&[CpZfFfHV%_#-paj-SSs>*K-"]A*+W+gT%'3
B>e.)rB*EG0@"*grU@SB,7i3X[^Y3%rX^>5RWAQfO/O"3thKIGYpP[bUMqEEaT"^b@fB!k.[
>QJ&e=sOi>qG$)K^ho-=9a6`<mjr=5\f02[MVg?*/+$MHBZ*5J=VJ::(fLK[dMM+a]A=;(oMH
A72).lgp]A:\@lY]Ad0+DN2p;dN8^%drE0[P:[n@HlteR7%Gki%C/&TNA:E!KMQaY32=O5ehA4
RjEcOO+1L]A>RAi&r3A,_)V^VYnndj='-MpEY.&]A]AL$%-kmb!!c7-^0&P^OuT#Y%G;rpj3@:q
M_!g0&E@o=6P>-Ke5[Hj09\iGZL&m^gXM$-:D:Nc0jY4[mb1UEVmM%1;t&R!?/hE#=L8he,*
#fX\f5=/QZpge_$]A-.Mj%^8Lm&X;Re#ej^lQk;;$884)Fp-1Vm23Ce"YR7u@.q%6"(fam>6e
QTd%mrCI32=;$!,o&@/bg72ikodVlCa9XbMEkc#<Qi`0ZQ*IFQdNq3Bf1W^f$ooU:7Sh+c*e
IZWH$BaWL+Ua_t=>T?*ZQln2"&dfT3\1+OR*fSGulUQ6E6ln\_S[&>Bi?j4,r"J>Rj,as\@n
knNhM5%Hl"H9!*EEN(FQ#ui1%KP3]A=LTN*!p9XFcm8XKVC$+5TZ!B,,!lV*G_U<RTW&>8Ol5
qG?9lCE#;(';t&>HIq9LO0s&c94q@B]A.A@of3=#k"L.n%9$^Eb"]AH@PhBV'egXJJBTi:'$W)
:Fb5Kr:eQM,,$uH0jnC"J48kC%`M!H`1dW#-Ai??nFe)/hrGkn)V_%#h",MElb]AMQ9WipDVl
QUngh.[)<S.k3S\L"PspeUOBGoQI3IL(V?Zq\iKB\>AgnFOtAa;*CZYPG$,FhM9N$ELnP-9g
1U1#Dem'fU$?0b1@4@b^oF2S.:]Aa-la;\_0#ZVFQ9./n^:#H75I_Vf=Z$V*!em.8YUa.?L3A
lJu7j^NaeRI;V<#O\_W*a$&:Nm@jf@AKcDhIF9tOm=J%m-`2gPB4C;6.VVeUFl:q]AV6JJF;;
0>3"l)?:/Z!,(0:@qmZG=*HPTLe3EM?mQl/r]AT6k"niaQBDaTrpe8O2Fd)#7tbF%45('Ng6/
`U;Zrkg_:(m')9)]AVlW(,aSAs&PcS$MYH_GpPSi3L8?X@s)*:\:PMhI*;BucieQ3GQ(LK;Q3
E?%e]A8kc)KI<H$Pl/7TRbd[963;$LQ\oIqbc(s&P(i!R3?)Mm*-.(G:`PNmJ:q9THp92('q"
."WUmER=.iSBkV\@hAAGcY\S=Ds(AD\kbBq,V)`@2`JBmKRlfV=4h6k:2,t@0`&WM3Z?h6`K
5au(A(/UaY%iuVs_n<'X!RSt^B8\nffM^KEH\a!PL<7&X_)%%Ro(Fs"DAp4m!_lJEQn#bVaY
C?[eUrS!^;.Q&fhlu]ALkX+&e=m00mmt:4/33H^!^>CYop1q6.,\sR6'r!Ll8:T1*:(_lgfOr
"?Y-ZuAjh?Q)87Ru-7&U`R7Wcf;+P$D1D,:a&#:6)Eq\R"gCi1<5teH'B(GQ!`ek)iR/!Aan
*fjV;QspF9nqE..nCUHQ'd20h#Nl?70t4GP3kR:(t5Q);CknGfll4(\IH[jp,l$&@,s+"X_.
;7<mQeHQ^c#F,eMq"d3;13Z6]A;g>VsjPjLmiWlaHf_(WNp?[lHQ7G&'lJ:d4Z*IQZ5#Pk3qW
YYOu#*8Yr7l%[V816TY8T9"E1QWmatdt0?l]A.!Oi"T,%cH#AZ?#[`nk/Q-6Lj2\I]Ao/>@M^(
.jYk?*2k-pE\/)_#4P(S5hgjk2-*.(q[==8(U'E9HrJD(f+8mfUHD_`SAc2)W$56G(KrKnZ\
1%HpgJ=hD=_@%73]As#AgQ>2U(`gu7E[BqJ'1n4c]A%4.Y<U_A?rQ2kD5a>!UB4F0+)P.3<N@Q
eYuoq8ni*$B(L?U-RZ.bK@#tde,"QTGr\OTS\a'84l)mW_)7:4VUmT[90^Ti[fYU)JX!spYb
Z%]A:8C)ER17q8?/Z^g6CiiM/)DoUu$-ZJe/J)Up_N:8<:Mj&kq]AG=mSi?9mo2e)@-=)hoY00
;=tOZk$I)LDYTG3iJT-l>$>*0]AmJA[%YI*NPU.oI!EC-"\./3"4ZlP"WsqaU%8e2kk[6M84;
.]Afb7RL*Pnr:LY?h*'o9R\">d]AOhb>Rnl,4Dl/'$n:PMi.\qp@h?^^C2M@&PlVAiY?BucXm/
"]A#9-+F]AsB2XMbIo,C@JBk14?N\I@i<TRY]A5G44Qf)t,=sOmth^fj9ORAl=L4lk,oS79Tp'd
5S8-fU"f\2HC]AHG&_[H^G7?i<\31qj8NI]A1%@[c@)1qYp<NK]ApU7pB7*>rGQS/LK=<iumP7q
RfG^@Ju#7GiFCn^Htkj=X-Lfs;,ih;0R&c9oCL`M1[mEj2!a2`rWJ?J,olJVC/KG_RQ0Gpms
*GN3s3Oa$'X)N_RhP+jj_V9k-HOre<dhkMT0D@b9CT_q!()>')(EiY'?".Th^&)<I`[a+s<1
EEHB;4thS.hpf&QY`D=cFRH\m.VH5fDT+6DsAS/$U.:\4dAd!g]AINcT$[>Jm?"M\QQD),ViB
<^-J38jT*)n!!;s3Mi8V:GOF6@E9J*N8)\[Io[m`EG*r7?+i4gei%^ZFk?3uVc\J:l/4N'5Q
E/5KoMRQ0qW8KULSZ]Af>CEBOfAjd$Q?AUfl[cO%GuMS6M);,'=C.=UFjnQC7:6'X"tY<t#<0
jS\B:2>G^k!=Q[XD^F,VRS=e+G<FfL]AIW?!S?oN)!VZ*JMLWKl#.;,2qTdd1(+7u."fEcMJg
&oG_0'1(gZiI'=Mi"g[T^_"L)/+4m.T,SfB_:;f<':25U]At#(g&lX</c\$!kb'pX8d0N4.jJ
7*sqL.=,iX5AhKbe2`QYH5SG-;&^/?-uPPLaW$]AATg:a/.EAD=94"&KHL/]ABB.Hf[s$KQ\dU
QZ#+8Hdu8k6eu.SAmfOXkq.`_u7ao")-o0/!nDJ(VU@@=--N!pV#/NoU6.@t?05dB82fClMi
5:<<3]AO2W":AD,Ms@LY'SqjS`6<dZ_KgBOZ.Gfj@hOZI"P'\!JC3k2m(7DN57F6scJ(CjlZj
#obu;c'R5UpO[l"3%SUR3FVXAZdjZW1#IFcmtiV<DT55?k<#XL(A6iO`S"WEh6fcUj)'bDr"
J6#3&<\&$@'+sVhB;m7K6pujT3[R(J>Gk,5!GI]A[JBZm7h.5_;($Sao9P+B,[alK=E+Kd:WR
42gf\"^=E2gR9;Zp5r0bjuDX9_i.bqk9%7nQL_Qf`!@Tf+4nRelm@1a<Il?*ERj;Qj39^%b7
ib!tjr&"u:"naIH4Rs&_10b*^0!<LD-0BZJ(Ii,$VoQ^\[IZDW7KIOjb&6Sqs#rFcrY>[GY?
p$=rBeR_X\eE>Rb[Ygo;Z(pA\0"iTmm&7:M'!9udgSLS\-%:I;L@LS\EnQ,,XJ-NF%?cpj4n
J$j4)`Nf<8N`;8MWQkB-P3#fKJMG'8LkkOp[CWI($[h=u.;9Up;QhIAb&FX#S16hS_F<.VQ^
B:9Fdg77cY@I*<5R!D&eeWgq+]AGhH7o$Z:#>FlJj'sD5j[Z4XF.a@ekQ4ajs"@7R8X8OVX6i
++*e9dMKMLFiS*#lA0e!kU.rg6*jiA'C4C5Lbt\%WW*Bi]A@MptRgA[0Nj1!"e^#$bUE3C)PO
Z)/b^p6j/R,pgeuF6<F&<6njGPe@9ofiRIV\>\"/&U42H@rf+1ERX3niOe/FCd5cT)o\.Ci7
]A@m=mfP-iO#UCbN>r!o4Q[nJ/D5lt44;A4-tHLDfe.S=[6M+-V(D;:I]A>[,.q8<'&IJAm;DR
9@\"?hA/FBQd5LOll+cZM-._]AG%10p0tEu9Nm,2sJ><gtpm\o+[@/<$ZRPIN>=%AQB\6WSBN
[PLMpY*><!3BK<,3'(p[l0.?4N<+7C.m)\`Q-n1af%)^1'0C_'kTag<V?A3rcDPuOLI4V`CG
NQ8KqWKHdds&AQCF5d^bF$R2%5o;\\M!B;?0KT="U,q>rS>:]A7G95F>Bk6$,aHi%fIhcSm^8
h`RfK<I:8-se2Whk?5#I!2YFu:D!cUiY*^5snSX<s=fb4>g!6KN$3)nj+s)UCdf*Hp.iKJlk
N:XD?$#kH\%Bb(=&Eu39lBA#^J6Koj#-1rC=96WfmnSQeJXFL[+.7Z`1D8HPI\sAeW1Z1Rg!
3:=ac5,3>.2=nN1`:L'sV;]A\D&Som8&6/$$D4)hW1Yl$bB;c7T6VkOuG4-AHfB=)p*b)i36Y
!AlViCBAm2bAjk9\5ft6Bn.m(?+1fp<V%A0A%a%X(R#EoW-n=l"H8hmKsNb(IPg"2(em"]ASh
tKVAN]A^V7Aia_2X`-+E&DPgr=IZkls[F&b`_Xb'4G,/S1[KMM0BeU?"D<q'i5jr'@/4bnhM9
0j:8&>H;fWW1[?c76mk3(^D%nBXR%eTKe`@Hl3``.4su/'fc#!J9sMJL@`2QlACeq"E8)LC5
"NF=N7_Eg@8a69Ab\V[GA-OT)nCJJ0A).C]A"3Er.Q_M7i<Vq]A`@'oMG61&._<KV?@<qcl,hb
83"L:1Vc+K-u%Kf5E%.M4!BXJ<d2n@RfK6l84"l'jr[Y&qYl4#0p>*$9QS2bS-N&b3m$Z%dX
4q<OuXDL9N%b@SVdcBA<lKa"0H6mRjFqY>)Xe?S%G8J[*koHd2#:SKt?Em4WUmKJaUsF3;$b
48.?,\e4laI"DX*2$G$c+Ao.nNlC+[4FG[?a"WqWk/9Ql6*KJ"@"$Z%:(@AZt^Vg([^%ISJq
if[jNL.kF6?(mEeKE$T?Mfrq`.?N7U@2qGI\")Ujq1BiB56+H4Q$>ZQnTJ[6Y.Vg@NA?rhYc
=\@j'7o5dg\eJ`q=u**c%3g@19,9PVX4&PKoti6LLo^88-8A*oOOp59q<8*YI_1mUQZHqYI#
n*`eLrkcj?l;l<R^M9;Pos9_U1/7bg]Aq>8o#^NmfF9(DAQA$2.Lm>HE)4!p$\-0uT6aOoJOZ
a09U;ZlqIh>skXS)u$>PfLp6r7,;J)!W(-ZE+"$md`cgiRcVd]AlpoVr<sDU^6$I"9;bM`$IX
]Ai@C/E(VQ$@P&ADu0\#C'FI-,N[;A`RI8#&Fi.6&!RE\?:\(QD0u]ASHBaccU4S&[5BA`G']Ap
Gio?l%q<sYM<,B88Qf686Zo'Y/AISqP@4E*H0QY:NjIjb*\qQ)_'ok>#2e#pjl1<nc+4T;0T
GEW?duCtG+6N%VV^c26;4N*pjV^s+5%9n]ArmZ"9ffP@G@4#Glh_f/hdtf74L;Rc%EGKXX1Lf
hj6-+NIg]A%!3YG2J_e]A!ZhiH%fYE#fnR*mce4==a]An#A0cSGP8SEKEl</3Q<PMj/\HIALu]A"
SB#18+ZKZ_9"K'pb]AUPX(hN_#_;=OL+f?L75I"ZlRFVVk/KqYUYn8b'^2'H(?i\eF=C9.sO3
VOfZ,3VMRQ&8Opb^2$`$E:Tl/\d!=Mn0\Ybn1#Rn1H:c'T3N"E(DJIFUhA^KH"q`BiIPRn9a
?2W=2l^lsK^hU>BWR^(5tPSdbkLUt(.A#C":Z^!u3iZU'?mI-e$e8Z]Aj1/aso26:IWdhlRP/
;FW;knRP:K>0'mf/OulE9pU0gH@KB^BR,p[9a"@K5oCB_s2qF_<%dslO9/i'?id\l#d\mLeF
%Xn]Ad6nD5cUTi*`kZMTnuVkd@OSkGPN^@K5W]AhI?dI-/Wm<']A^I=>kPZ!UgYq=lh6uZ:oED=
#Xh_p+-7'@j2rap;["B5%qZf"b2S0iNm;A"]AQVK7Z$XjeLD/`NC4o%\>Ou6+K6)2/3\@8/^/
o5RUnmhM5X1&IEkf[HlBY54`0j6A)l34cf)Zc:OIXKp:0^du;;&_9kV*7#=%V>ldU`c2_"9h
#PK%nYJ:%fD%A,bE1:+<n4UW-\<)o52.KBGkaFcgGACFBdgnQ9qXP>*3PaT)2n">;$,!GCqX
2@lT4L`GU6q?hnCscO=e:d5$opab]AG3Z^nfe6XJBVlQqIsML`0981]Aj=9_&B(`;MIF3f8?\'
5,4`qW-6/JYS'sHscpe"VdK)F!kCF7ju'hX<L?A!e4;G1X)U@T-p.W0X6lH8G4WPAc?h.dHT
;:<8/i&mpnf]AULHBpY7U_nd6/6JRR>K=L#XPl(<R*\b>.en0'=1uNo.E2(7!b>kk+rgiq-aD
KV0f<pPRVV+n7gks[rRHn$E*F>\p_1n\o5$?[$EYV/aOC,I[C-OR-5**f#ITH-^cln\<OQk4
Wf=tJ14_GD'$3!SD67A6B6qV.bG4I`4iT[_4U;4ZZs.eX]AB+,*<@-'sR9U%,>3mE'P=*bLp9
^Y^SMgJ0m[W@T'dHc$cT/n<6.a.)LpR4dj;LO$gO9CsGJ':uO,Z+8+`[N^3C#F<P@3\uHcYN
5;`K(gT6fBoW1cXU/\g-#V?Y^8T/$8rlJ%<K5MN_T83#[DW]ALV`/;knAuo9%]A<^%At?X(-"Q
AWg6una6eo%"^")jVA"hWL8XKQg:in5?i'1.p]Al9pg[)O8PK<;"HZD!5.[$g2F5.XG+k8$8g
nY:_jSB+G1VZ1iN(d19`%;NiVe?j?0*gI89SZ[W'<o0U,,dN>Pd?u$PM7&60p/CFQnN'VBpo
N:dm\/X%]AcVm8C1nDW>S1[HLB>I;uqji,O%)3_-J8&68/dmV_b2q<T)OBK9'k>MI]AkiBsOk@
^s?/IT@nH`T_ZYfBu+)It)st7jMsODP*ThfLT7@bdsp`FL/*09"B(6Qo>)bR,-dM(I<rn,SN
B0oR]A!;lH4'77E&c7-1rr>?-p!_oFF?hi\6u0em^ZT<.<4ZiA0'@BX1^]Agch,<SU>uc&W(;d
X\?n8N3\+KpeFK*bq\hS>qmXP<:l>D6cXuAX6<R&LG';Sd9m3(EH*_h/BT_"aPI_`Wl]A0h:G
.JJV.V>[Tnj+Kkmb"UHhjsrk*$dX^:`7#>gM?6LL7_"^Mkh9GTXgB0J:n0Z$h6^lX"5Ld8rn
[jX^BMhq$AQBa\1;+Tr1CF2W@m^Gk`U6rR,*DuqEPJ?>LZkh1r,"Vfj]Adj)"<`0jeI$^md"r
'K`$H%TTZq&6*gP<@$l]A`J[\gpN^RD9U;`9DAZd_ln"AOUd+D--Z<gj*KF_&hb[Wg]Ac&kKi`
*1ZnsY&T*'r7>XD>+F1+j3YrFE4)A\+eE0L4*d]AJGeFO(RVn)*".:#$NLQ+n-g$XoriU;P6+
>.)d+LcGF_-WuBDAggt*1/Vf7``[39jl+i)9SWKkh/DDeJng'gDf>$[)2L6K2r/'g*DQ,+LF
?u'hS9D3T+-dL?7kq&kd\cH:EDEtZ-?#UZ=i\EC=C6CO0sBX`6o-15CDZLEqKU^9;cRWXt_@
T.IB9s2rKA]ANt::h'Ms[lSo4h4l0b3!9HRm^lBe&T1%PJ=]AV,"Bii*Dl"Z>:r.".oZ8YEWlZ
RW$]AC,&51iN)O<s6]AN6I+;i61NSR(1#Fc]AU(PV^a$!?TjUXV?*"Gp=WhmY#9^#2H=)o5/I9!
?!?lII'IORp)H9,+h8t1^$Z=,W&HZ*gun<jl\;3ep0l\uSIYYM>O=56oI[ZU=Wo_.k)Lg*);
DZN0O;8%M"l4r07cH]A1AYYTG>fa)iS5_fTnN-o!XI202]A+b2s\h8EN1]AH`DZ!B6kLqqD1b=?
$!;UTEBZiUYBA;4f#LG'`NbeiZpF]AKGm[3;"6qHYW_cYR6h=9Yb@_lA]A>B*+:lh3nKBpiPk-
347k&M>_CHaaNO4$cZ#[tV/:YP!V(f'f'2#<L8XVt%M'#ZPj>/b6p.q"$kV"l4Fu2=U,s+^2
f\Fl4OCu1#9#M!bs1\(hZCDro6WYW\t=9NR"'BRd=#rHXX&e+rQ3KU*0UZd9YeuuQT=^OBZ$
ta><LpEL%p2O"eS3hKPm%#+g8=i^j@r#ZF$L;d#,f,R@+p*,b;o-lf*i'l8;*f2^DOVrh0H"
RK%C9SipAfoX?+@B&Tg,OCRUY#1KB[<Bp`gJ:>9.5b1IPF3MJ,jCeTk!R/2Er3T5f2eW6FNn
@UFS'ss7`bjc_\1T%l>:+`+^SJJ6^38Z6c'OiuIMt#V@$tYWKH6l/X_5anPsnCCDgJ!1Y.;V
5P=1^`*_C=un,kK@fo;+IS\I^*.2F*.dILYKk8q?%nIN.I@1UP8VFSngZ./,?^F:BKWQHkCb
ZBH6Vo6lEe]AXEh#RZ;LO<D-*q'5cUT]AIIQT;MKONGr9n^+.>(NfX&SpFhPad-Y\IrEK*AlJi
[/$ojK:PqPmo"J>?6WL.e6S:4C\qNpru^+P]AgStEFS,2^^'NHlOc[D?k2HN!OIRRPZs;*>DG
;Z/\@P3C$=cEJVVWTT(A\@jYP)H>#RJpRM`?r^IPJ^PQ@5@E\9.2JaCIG*<,SubsiM)LZ\+-
5N+YI/]A9rU?H$XsA>C<6`o&>>L^(h@$bU%iZ"DV&G!k54:Y*&5(#b7U"b;O$J\l.j#m]AUP:!
O2HJg(lE_&>]A6E^iWcH?_s%r'kn5c\=M7RVq?(s9V4gJPdJ2enDqZeAPMRTI.e$1.VUX]A+nn
ETuLrN`PJ:1h+IOE^Yt(N2"bMo39ki8?T(KMK,CZbP+8s8IH:.i]ANMb&IUDD&kf2Ecr0NSVV
>'dPA6\aSa"UfD6/*/]A9;.b)'PfEC$.jR_&OO^gKL\&XXn>G62W4,I$2SIW\3"E$`FW)mV'f
;5_6G[s;t5Z#.K*@aSs'\*6)2[(!YIVPP/1?I.""ou]A0:+-Q8#8.#cl.7#&(K0/bK;FBR)8+
&g>#-Q,#pY?m,*A,EX:N>1N.3T)L*tUamkd`@P6Sgn/<guF42F&QlNd8T.d"4F/Bb^Cm\ZNP
C(2/5`*.ic(JE[8dI=8pAA?Q\=a)TatZY#H%YTX[t/Q'2lNa&cMdu0c.AS(E(d+fgH(Dkgc#
UE=nY9>-#qQf%:;]A-.[%@\qJ\YG/ZYfUk-rq#C>V"@8Qe*?4u9d,aq(g]A1dN9X[@*n;\sDY:
.JKdi(pX>n^C/LE&$/TiT1j):Lb8]A3[[Qb?7r`fn<X_<^Hf'[?4-T,RX`+V!e_V\@is029,m
9smISb@A'g6WHJWg,mKY@mX/A[$@)KRUT8dc%5`Ulq2IBgho\8%@h+]A$Tli*Aam0FlL\*5!j
i-5U6$Epn*?6TgY2%!q?8N-;H^DTDX3:?*7:a?Ms]AJO.2LS%>(EV78RH\lRnb=NW5mjL+@-8
cCfuU&Raa]AmEd-O&iYYs-kC1eA/h/FE@_6o,h#usC\ut=uT&YCOfa=Y=PIMVl5KI.uo4K3sX
u1$hhH8\Vp84b0+K0FVqkTmk#dS+`F=5"-^2!PhYKKp3R>H;964(2C(HL>d059j[:LK-@;/I
4T]A@]AkhX'=bqT&DYTSMRk;,!O>0!Lo,RB@!/,FB,g>p>/S]A]A(,]AQ*Z^F1<M"umDe1=rFQP_u
lu:E*gQaR50A,oYR&S>_'oT%"k:[:d(OoO2#qk^0o5d4T.s^AhJoNr\`6ma%Z?d$2eR#'Bp[
H[Lm@LMs<(o51KN'sAeY+e.i=.4,Ru8"<`I:EgGW6,]ABG]AUq%9oL)(]A;g:::E2XbKk0\c."2
W]AX6038$=n\S&_#+^Gt3qTchOT*La;-BZP)(#'g[pNp/_CRuUS9%h,%ZUG=LKks2gl-]A_g"a
6-0LJ=Fl1-,r2o_M3s@dC7eV:B&ILj$<(oJ7[mmLeU<)#:AJV9=PXH#_Ql_3K<9S\G@-@*/)
7e034)n/i(DH)6Er)fcbmc>GgiI65OV9h(RnVC/.(>H"9>OQQ0/Ub9I6m1g.U)NQCsS7aupT
l?0Y^%%Uoi0JK`d0@*eF`t5FgB\:DOc]A?$&35,M',dmui!/?PO-cj.i2st0lH)7#r<^Vo$cA
BO/[iZf0[*K18&b5i-#uXk"f[pt]A=X]A)EO..7ZI.g0J(k:(;49O"_djG=Cf55XVC2^$4eJTP
@PA0RYXf)s.2\LmZo8`J:Ips_-SNhT#eh:#<7NB7\3sm`IN%q);A(Q\p2t1:*!NJSSP6oa"J
&SnT)Cf)VF[OXraZ#,>\*5)h"O>j!7E]A9$UtKq7md[Yt6LL1i)jdFQCW>cfhoGggZ"1:i+)*
46Un.[ipf1m[Ro]AZ<\&Go8Tod:MqE5C-F5E=)N;Q[u\b]Ah0:E0E0V,bY(dR#B/TDOY>c(,Ag
I)gFm=cZ(;9Do$BV3Q%pe`-PnoEa`a?*DcG,b`J`3[oRkF57fF@3B=.@WQ$hi]A6!L"-e+"U7
f#@eXL$FaKVp85E8eegnWN80ahDf;,rmk4D^cLIhuGQ@%o/!pS!n?R(1^@W%1)a$WT%MnOi^
q=`p6;heD??m&V`oh)ao+(2+$ucO$@_g'!ipn8F^j"[uuPMTtRUZTD'IG0g[G!:6^odO"+f#
+@8c29+T_,o^VZL:2;FP0t(T(#'b3d1mb5!OOs*q;/8j+<J[OR"OQ_!';>f=IgG6+SQYp.^2
+:*[)c=Y/o%gPMF('5%#1PUT!6MQ0G(C)c_(L:mIU?0_9d'Y+me!pDdRK845j6&2J$E59EBd
HQ?R8!b\k@LgG)N@F$EBT&)V#J'6\U:SeliD<0un_lpI73,GLH:]A[#s2D,e0-oGnl9496bI_
kq1g^9VH;qbLRSc*?XG[TMt;a%Mr1&FN%rN`9G!_Ci7Nnn@i_bMs#fJ5%"]Aa@XG9kU]A'\BIt
?<^_5R)a!69qDC/Y1`p:X5cEtEL?npbY-Q.W?SQ3Y,Fs'4W]A(8B<MW_VZ2WGKI2+^6`BIZPm
u2HJ,t[`H*>B5R5TUfu,A1Qdo#6NuWIt*ffaF"G%E/i;:nr*^i$.&.;iTFYU=Q9r-p)=?[F<
#`qkQhHS\J37J(*H1&'4,uo*8YTNj.\NXi0j0*URW):)f]A/R*SI-JPh`N<qa%RZ[o!>Z[BMQ
NfsmrToq4K.ClK?#>38kSQ9$pZE.jeVPU+8C(N+%-9A<"]AEGP.jh9<YLSp?1S[r4#Bs:;VY9
.GCb,J.F2n)B=0C9/^5h7PfihNY04$O!X<I,%\]ACBAqR+c-6Aa*b=B"9:#h!XQ&o1h*qOrdb
[?BhZDM(6kigh]AV$\Ye;m&;@Ncj+.9K.KD)<8=&/K?GYPA@*b2lD;>*Y_VWSBcY'^/FWOK3b
l)mq/i^4l#2cDNp=Y48qnG'gR2l#2NeR*6(_ANMTFH3EWBDH'6Yn7d+Ht0G@:jYFG8j(6MDA
aSCK:tVdud\@4l:h9<$bCL-$g`nWE]AQL&]A&//dUO7o^)E'R/.[NF=4g2:15OT&*/Hb?=+:j0
G'8%JA's;1U)!97;,,b;KD>Yc_Je?Di]AcGejSng0^WeY[YUjklkFATE9$f&Kj50ZPBkdpK)U
]AWZEW,rq!QUV*fC.i4=i&8h!N<B/9-&2R/+X&%^oNj`WjPWW'm:A0Va<@\NOs[s#km_o#F(-
g]A8>]A)48!5:mjq#DdX5$aUuTGEEKict$=D)cq]A;qH_/KRU*%?!nlH?^4G_qBX.sdi:,D:$oc
EO+TN8oC;RP(AplnnY<r9,`<Qtsi]AAqS"=CPp9W5bIH*;:Y@Le*kE=?5LljNCI%F-bZ\"fq\
L,-Hn97B#>O'V.D:f9J&&,4Wj9IkFp<UZe$GV@F?]ADL8]ADF/(fB^2<FZrn=2,4A]A0->U_[aZ
D3&IRGIlJFVmKLP1rZtd),6.&B;qQNa"DLBCnee]AUXpMLs3?%?WTirgrIu"F#uV"HC<pOsA)
C,RPh<ps6G+]A-R_TLg9_84hr1b-kS6HO%0D42.IsG[eml_h#!;XqZ9Bp?.@(.O%R5M:'Y-+p
c6R4$MYPnRXUI3lCra[S56+NRtpc#eP^'jfA7cc2+P>Pufg,0"ET>f\b=-!gI3AKV#568:5#
ebAW,k4BB`.?/)_Zjsk><MG3H^CP=MFo/^an+<jH0VBAU.R?F-*U)^fE/QK>jnh`PZ/=nP$9
.N)fr]AjI)Nlo?+n#P`4,ujh2[e]Ac8FK+Cn's.WjX<pc0@4AQ^`>T+7e7*<&;lZ47Gk?b29>S
=BSe/I@R-P(<7StZA0@MfeYKf<:t"Ta&r&T2pet!kTc0!N11T$5Oai5_TSoFB6s0.56utNi5
dnV(`9$m*Sg6aKp"nqB^1PW.-Vf"#sE.\B>rVg4*)S-V(T*)*]AE_uqshsWBAk9&>2Pc44&/8
8(H:ueRKDfq!<f1eM==lr2Z=G1Q<d;u#.2&=CPggJk5V6%.Con/4]A[*EK:e?k'DArj"D4?]A=
aM?9_SL-5AbagT;ej75rCq^8%2`BABq>1;[5FuW`;#d\d1f>FT<@Ot8R/FS<R=]ALXZ%Wdh%-
E2ZqI-@Y]A7e)n@LmFn6MeCKq;$n1#mMAr/0fTW,V2dR\YO7rE4`qYYbi>LDmN\m[7KKPFF<j
pskh`e^\hb4"Ers2/:*-PTKU!,M=@H*aX9,W.fGZP=lfFBmKgfs5K&Nh*E*Le(%KuYq*%N3*
3carL/Ln.;SC":C+DT?Dq5)EcH4Z1`7jQa-_K[#:s,'+Pi_*f<uj/UG:L0qH/"j0jp:)]AS<l
'X.2]A3;(uE*X%7In_o/P<)=ljQk:U"!<LNTgCaH9J*\lV06Os"A=1.mX&S)/o0A$[SQAnZ7Y
OL'6:O%aPqh_4:s+7.MrWQ)C7/FjF&Qm69*0Ql9nog!Cr'q&'U)1=)<DqHV$ekVI!iSU?^np
.g,I_hHi14_?)V;(d,rE,IYEZ_TO=.Tn`7C$lYELMVKnIJ/4tH3Lh7FpVar2THo3,=$im1uF
qHE1#TG*YjS#9Sr`T\Pdp6pgUZFN@e*^0Q9T5JSWYu5IOm18q(2mL[\m`G1R`_]A:)5-$maes
f@+"\V1)(1T/#;oH]AhAMt?HIdA)b\B0qub9*lOEGY@!EntAIpp/b6i9!c-pscA?98Td'Yas,
aXOi,;o\u&KD^$6P(aZZ-?ETm8h6WM\pjScY8</\+VP^6LnUZAC<,D8fE&OG!3T(:_I"UkEg
8+irme.8`C!F[-0f0gji!GS&?flVMPrfVk`c0SCgP-+uP&j>D-"QP#_th*tqnQCUeQpGoJ9%
[U'F5fXfIH?8<Yfql&rr7Bmd.!5\LqhCYcqfjTE6D7%",nE+D4W-c?/='K*LcQ.<(k&i#l$F
Z`'gYe(2:_W^!!3]AGUIB>W#k(QGc"P2at4V`X[B7a6NP+?8eY:LnQ$E.]AZNhN,E2(h8PYE(#
A@;*/';YO3bA#Onk+==QF[5nn-38>:pQ+Eq:mcUK<.dJCIG,@m?.??+j!eb6ml8HF<&tA'0)
`A:iA4=<EG%hnn/3>=$^Jl$8iknjH]AR%R`1rX\?OjIRF:chLq4i,.35DH@*,SjOm0<5X(*4S
k7HoWtYoXa_b,6q+Bl;\du*/^&BqthH:o1XYIX_ZLIR`2"M$U&e<`:k)(@*%SgnZ+$$4pb'1
.5:=_<]A+p.unW09/o\7"oE);3^*WT"^7ZPKSK;(.Z2?=)Jl:Pp!X5UY[`T\SL2?&'2f8mZO4
,^Wh4@*Voc_HXY@>*H8L+Qu\'/a'kA9g$["iU]AH7"\;3X4Vo2?M)bZ$+&[tWH,k8Xm8ro.1c
ItJL".NMft7(d5jaI>X=q7$$g4+\nKT0i_=uj0b28up(Ma-PpMJAAR*XAumr<7/DiI[/6RY;
Jib.AVWF'<'53e<"pQ-e@Q72?<&uMg/'iU8XBk/,<&8gX\'`3DHeZO&o#H3Lt>huSFEtG."r
*)6l7q980^d;oWV_"^K[kVb&qGOcm3RRV3X%dAUQo43?94uBc45oT!6nE)IY_DJLhMRdCLjZ
%O]AX8R;8T,TIXGBk(R>e@SojoUnGF08)QLm^Cc?tR.]AXP2#_AkQsdZA,D*car/Ph[LML:nE)
*aVb,e%$E=gMO'\rT:q2+0T"`<dFR^eNS="RKdW`_n-]A.gMLok\U7.#c2@8+SgbL(L"l$R42
p9Y>1j4BKJaS,dD4Wp>?R<m0?r(Sg6F?.Oqt;u0^\*6P$n0-VJk3$E<:3lnO0eT\nlb-+;9:
\Fg%lifYp6&GIXd&#GQ6@6G']A#<]A8FD*-OBc(O8Rcd;i'3q^dZ#6A&9#!hEScY4?+ArrctmL
/GB+>ut4:ls&s&`]A?oS0Xgpe0_QRLs5+Z/]A<l<OMmb"tc7:MRIH%(!o2J'YZdV[achXo,%<C
D?mePAl`W;<-'4ks:OF)DAfGN/Zc$-'K]AR/i?12[LQF=-g[7q2`7bELbg(]AR-0f"_-DXt2*[
:KLSjj^27qg0\,gc#9cOC'1u3A;==E/gjMJ\TjCukPXs&S;Jj/d(?*Z[s']AI17_68><qZB6#
GAZM<Y`]Ae&uR+<b\206/W(4XYlCQXtJX7&@5;c;(Z5JlN)^#I=6Og.cc5c3iZQ$Hl9nHq6G4
<JU6,<U@"+5M0N-[RfD02p5M+tN$'XVXQS.K[hAOW!q`g,C(E1Mrf<LVUQT6L-Ph/f2/)3Rp
mAfiAVMYM08%Ej%od9[jB;*-J$hGB<+*I)Zb\/m#qW:V-5LA'Gm<e#Ddtcr).Jd58L;XK@8j
::9J7RO<o4:AeG`98'GqK;$-eI`^H2]A=4a$%SS]AjWW6"jAf+b)r7Lg*aZBC?fJam/et+H5Ot
jH2?N%A?q_b2Ya;/(:M/K/dVMMhtD[kM3O%b!;fe4G.G%&#cm4*/9XE0VH:_hV)RHOg$REYG
IN."6Uh7$p5t]A?<aJGb]A+Gh,@HHqe+dT$%DDEB[Mb<k&Y7JDg.7q2JJ2t80QPJ\Wuoh"om6V
2B#s$')mtXbdS^.]Ajtm6e<hNG>D3;CcN`cb%VbJj47Cm:.#@Sdsa;s/^;".6YLUpr)qX;kZ3
!D.9a7ucuq"e"(EEeeIhThm&.*..brf8e9*YG=E[SAG0DbPaM0i>ulNP+=OA^>QJpR=X:`G,
1(=0.]AjVnG=1&'@)6[^\=^R1!dPbN#NIi9<RU81_g/#L>!a:6$8(L!;YbfE0`bJL=TG/946R
#Ap,uXS>#$S4LpI3R4'#E<i>]AK:OGM05iZplCjf70NUP-K=@kgob+jkU;pIfNa3HCPYqtngD
FLr`m"VJXSWB<_9TFg=!.3oHJg[ZrF6>/hbi"4rFCN[Z*[<Sd@%"/l8-04#;cUa04nJ4-%8j
a1eVQ1%V:U\DO!YiqJU[:(tW$$qEB=RX39$,2NuQmg\"9T1B/`d8lpUSs79.I4Dp*Bo;=1d2
oKR]AFD#2Oj?MN==?.cGm\.FGVW!h"1G]A^2-G_gDPUqb-C2Uc4^Ki(M=rLh-5W"*M0!hg.V+2
S-$uC`SI66qM5kC-?ms_GLC#,#DMi37D>$:44.PN2j*99!uL@$22[CbHEYH5&O+3)0_b:-VN
=t8>;m(hBb^/@kE,:'WH%2scpCY!JK90C]A4Ib7U^RHAriF%C@JBP3K0093O_R!QaW#>,D3h3
:,PN(%7KHFKaHg-urR(s+=m-ls96BPM5-&*sRim-j=2AS#J"h:'a'H@9(g-L)n#M-VFlCDe_
A(%JUt(]AH(aAeJitc<JmC[@^erY?%2["c1eldk^.cNOd=e*dB&F4eBW4F=(E^ROjZlNkfG4?
U*[Ts/qM%hR*t2VO5h$RdjWg7a'A,`#b]A=kBo%X^gu)qOY^4b99CeuV&sG9lsnd[-9=FgW,p
D,-AtE9aH/krp!.W\ft"Wt^fY/6!CEqmr8@^8hP8#Dih^e:GsoZ/TV)AZ;i_ngR?Md#['lT"
dt*V:h;)@smKkO+#$mi`)4UH&-,HA:g`kY$dF9cZJ&]A"JLfY)4BEY<PKmt)ARDO)OaX*cukM
pN&Ui"q.5%cpRg(i[.Rh'49d8pbZEat@0C`DeK0*'q6()SUjmrOA:!8gd7rM;rB+@<JE4)!T
ZAF&bplrXV5<[QSUl/85ZSD9a;G&D9-:/9g3WKX\LE\]ACg]A)SqW2hUn_Pkg'aoG"I*>05"@"
)#in&9$RqR!rRgrT,$X,h*CA:D`LoK".MHgR%UR,QCNC^YNU[]ABlBg-8gq_qA1c[R_"RIZ_h
Wf&hdjhj0.-LOS7oZ>4YpH>G)Esm\V[!4DaW58D.1dn99Y)0)fnD7V;7FWOi0b4Yarde:QPF
-6!4k!dmT+Yol(dL`@F;bD0G0."=<pFL-^goPu)6h[_s?[?>m[?cTDPHeY0[YhI:gF32g:<&
'V=f\'*L#4V"QCo8dbE7,Y>Z`jR9a!ke;@$lgm3)4PLX.R'liq&Q*:5tWa_!`tBqfeG(:?er
kC@X'I7H1j:Yq+20jC@&WS-EW**udtijBR)fFXjIo(P&>ZhfXo_p1&Us3:5+EEK%(tJ5Y?h:
tHNu$nJ8]AUF="IecDcd1kMCR;KkC_4[,6>JJV*E\T3-RN^k`$2<3?ZD]A6Y<m=&[f2eS#[@'!
GOEtD)(Q`!+nK9HD&.R+Kp9t7m^$m#d.S<^=[2d?QiQPeUsZYM_>d,lbGBV=89`hR'_qW;Tn
94^\I:80oK>@loQncJreh)pa.&40Rn*u[%%dhs;M33GIsc!I;RTh>[OXr7#co7(nLCOWe:g*
-L^mP4c4-LqU+QU(6'3As"r5;p<BqBLAl+NLURN^iB!e15"7I$75W1[ELE?.\G/.J@Hu9;'P
VlFShG4"P;F^9BAIEM#<maUa/=T1ZH@R*C67Em9OKKuFZ!gij_M*lsS7F_W<e<>]AX6Ce\PG,
8Ta>BjSi5:K5:;]AU3u,U`ul&8".t&]AUf$sTZ7er4g$o<3nR7>f-^sJ-s%"FQYL';k>B,b6iZ
$m4rT77QR&t,M1#`$:5^eKFccBDIeJWZgjV%X><VK_)UnW&oVT6ef\,@jd)QDCQ3Qo+BGe'_
JVR<M_Z<PT%@N*[GZ\&padqbUCKQ;#H(F'fMS-U@#rd+2-2Qom+&t^k^PDFl@a!@?%F+-tTD
n+E@(`b00Juq8g/;8g,ktU>>_cna,C;Y"oQ1-^M8V7mV[_>(,!c"s%TDjhUW:1W&c202)nRN
E&ZXA%N4_+f]AZ.O5g1Oog.O_b"A-+64+Q<?/XIn4q!h9ui9A'tlAp=[iX=0//_7`HtH02<^]A
[=13C[0\4e2=#]ATS6JMc'huXn'.eP6N3g?W]Ao-i)`-HCroP^Mi5mN=jU0s1,:V7-0m$>jP6A
orYaB'\]A6odZ[M5BDnXtt1XCkmR7T_u]A=NAp52OJ2prUq&Z*.\0BHuS/tDG-7h+fSiQVINH<
.5es87p;;TlX*6lLO]A5/:(&R1#'s0jcIrA[L3LMLQb8d9R7;Yl-JoEmooR:'m7J<Rdfto9o[
MXZ'`[<+/PB;?D7U&p_860&65,P!WS?kWEH&_g0s(:Sq`\le^qS^R1n))\YLhKL)_R71qH3E
99a.0ncp5/t?u!IEGO:'HM[N8g$Ik4bTXr2S%LUT0/6%ink\=iBqU5a5*kC@Z<,j'0M"U8I0
$*EokPX6L]A@&3V)(u"WhL`tq)2a&]ARA`(:)=a^hN.SKJ<>gf'DrQ?!/SSXl+r'4'G^5:pS6F
uN\M*tbq*DR[=\&Yl07D1HZLXSEFo,qNA!*tJ!25Q\[KheF?O%A7k*V+"9K5KQidFW;!(F!$
36tG&\S`"Z7s&r]A]Ag?CZ\#5E&TNXR9TN;/M",;K+3k9YqofRGoTpGGM*E6D_M0S*\_$)b)'d
FKsEH6pg?Vj;g<L/u!PNA6A.:aU:b&XPN<7m2UUEV1GgHSF8Sb6NdbRceNP#:.3]AQ=#dK^;4
V))^;]As3AJBWR>K^/GTKDg1S`nF3=mA29\Yta()hKc@u=e@:TguAe@#-#Q'?lT8_u37#(Kp[
EhKt:(4W]AGsD>'hnl6Fif4A6m`p:U+;j"No/!m6N(S[H^8p^IhK;%phV7]AUFZ"*pIW6-FSsu
?j]ALp+7cjWf^nkI2d00`*#3"c'(=FYmZWmTNu\odld:cH'\RW5Fl:^43Pg6i/r2&,FKHa@-?
An;s1`j_R+CsMF<@@K#4g&]AZ^kY/[l5!#k@%$+8'^moWBn%V\FAP0kMMH[&k3$I`9,_A/c\=
[4Zk93?.MHdqFZTX3<MUi99;SeYPJ7c/,C,[N1"JpTX+JOk;^3h<X1f6%in'%P4<!;/np16`
L1"I"T'jr`*MRY!;3RL9(9BgVSgo8)>a"#@9!WoDU+O5Br+7+ZR+G[BrL<B4BPJNb2rcBp*Z
EhpHk.dlhD@s:UXqp^,;2U=SO1b@r')?@(8H`X[ncs5i0lP&4<NU[X,S/M*4:V#l7f(\YDn:
nLoR=m^]AE]AK*?dBb<MBDE#QHnjhkL2^T-%<6g>00P2mfcS\VHeHr>)-DH,3TNoTHMR.MBTs+
JEQh,V>Fm.6P-E[k;OTLE#[6Sb(K:Pg-&_\j:gb4Ku5*I7PXg]A_XP(1dm$*7-HT']AdTpua#$
,,H8P@kZNJ@]ABqr-Q!p:ar:Es&p9kA$>!'GQ@:NrCTsP50#g]AABK]A>C;S.?%[2ZO<PD=4]AQR
p\^Xb]A(0P/_BE^=Ab*\T6P$lr:i]AD=fAG4$3`&RW7<?^HlN/5f#aAeo-"Eg+LBh)3Ie,_&Pa
@KoiaO^A?;dLH3HrTsT,Lim4Wh>7:42.H"[S]A5$2>^.!he"g#>]AiT_b+KeX;BPs`KA0DQHlT
Lrr/`V^%,fshq)=Q"f'.kGU,5>+RRRU!au(lYr9T`pVs3_BEHok&Q\hKQNOnno)9VErjeZVh
QnG:A4"<,*2<.^n[G"K4!:Lrf)fNR1F(6csG)QdsMs*+jJqo[:s,FAF^"`JHd9$h6?[_QNJE
#P\I*W,WI<PX&Fl3O/e@-DZhU?c00\:4P^gj8AO'9n20`.@.IcFR\HIPpRY<MeAqUI\crp;<
ZIaESoJotk&^H,[[7nN^FUOTsa'5u\0^NZB.jZdKGh8=;`FhEsI:]A-8?k-t:%]AKSXZmI*j<s
0EL=&!k'RG'ilqDQTK%UIM;-i@Cj?$tO=`i5WlElL=PCfoOkbhct%#O+'^pW2U^:LWs4-rH9
'-oW-m,RKjiSq/7WFCtDT_(@j[pRN+fNm?F@UbRc&tNQ\JqUTRMnl'pQ_H&ou6a'6HAIq\"p
h<_m7']A1MHiCA7+hOhOXmBUAXj:?/H5^kd/s/+J!B4N@%Nj<$cA:J=#h2hOKN/bU'm!jWJT-
3qW8H&pYItHaR+SdBUrX"a;K&iOHq'S`4$'KdijI[Rj-V45[OSo++m[3b%]AJRTM]Au/Q=79L@
n@]A;kHruV~
]]></IM>
<ElementCaseMobileAttrProvider horizontal="4" vertical="4" zoom="true" refresh="false" isUseHTML="false" isMobileCanvasSize="false" appearRefresh="false" allowFullScreen="false" allowDoubleClickOrZoom="true" functionalWhenUnactivated="true"/>
<MobileFormCollapsedStyle class="com.fr.form.ui.mobile.MobileFormCollapsedStyle">
<collapseButton showButton="true" foldedHint="" unfoldedHint="" defaultState="0">
<color>
<FineColor color="-6710887" hor="-1" ver="-1"/>
</color>
</collapseButton>
<collapsedWork value="false"/>
<lineAttr number="1"/>
</MobileFormCollapsedStyle>
</InnerWidget>
<BoundsAttr x="0" y="0" width="375" height="228"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="375" height="228"/>
</Widget>
<ShowBookmarks showBookmarks="true"/>
<Sorted sorted="true"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="viewItemBtn"/>
<Widget widgetName="qrcode"/>
<Widget widgetName="rName"/>
<Widget widgetName="submit_btn"/>
<Widget widgetName="transaction_id"/>
<Widget widgetName="history_id"/>
<Widget widgetName="outcome"/>
<Widget widgetName="label0"/>
<Widget widgetName="outcome_id"/>
<Widget widgetName="process_id"/>
<Widget widgetName="historyBtn"/>
</MobileWidgetList>
<FrozenWidgets/>
<MobileBookMarkStyle class="com.fr.form.ui.mobile.impl.DefaultMobileBookMarkStyle"/>
<WidgetZoomAttr compState="1" scaleAttr="1"/>
<AppRelayout appRelayout="false"/>
<Size width="375" height="560"/>
<BodyLayoutType type="0"/>
</Center>
</Layout>
<DesignerVersion DesignerVersion="LAA"/>
<PreviewType PreviewType="4"/>
<TemplateThemeAttrMark class="com.fr.base.iofile.attr.TemplateThemeAttrMark">
<TemplateThemeAttrMark name="Classic Sedate" dark="false"/>
</TemplateThemeAttrMark>
<WatermarkAttr class="com.fr.base.iofile.attr.WatermarkAttr">
<WatermarkAttr fontSize="20" horizontalGap="200" verticalGap="100" valid="false">
<color>
<FineColor color="-6710887" hor="-1" ver="-1"/>
</color>
<Text>
<![CDATA[]]></Text>
</WatermarkAttr>
</WatermarkAttr>
<TemplateLayoutIdAttrMark class="com.fr.base.iofile.attr.TemplateLayoutIdAttrMark">
<TemplateLayoutIdAttrMark LayoutId="9ebf6aff-ad53-45a9-a175-9633f4162a3a"/>
</TemplateLayoutIdAttrMark>
<MobileOnlyTemplateAttrMark class="com.fr.base.iofile.attr.MobileOnlyTemplateAttrMark"/>
<StrategyConfigsAttr class="com.fr.esd.core.strategy.persistence.StrategyConfigsAttr">
<StrategyConfigs>
<StrategyConfig dsName="hierarchy" enabled="false" useGlobal="true" shouldMonitor="true" shouldEvolve="false" scheduleBySchema="false" timeToLive="1500000" timeToIdle="86400000" updateInterval="1500000" terminalTime="" updateSchema="0 0 8 * * ? *" activeInitiation="false"/>
<StrategyConfig dsName="requestors" enabled="false" useGlobal="true" shouldMonitor="true" shouldEvolve="false" scheduleBySchema="false" timeToLive="1500000" timeToIdle="86400000" updateInterval="1500000" terminalTime="" updateSchema="0 0 8 * * ? *" activeInitiation="false"/>
<StrategyConfig dsName="state" enabled="false" useGlobal="true" shouldMonitor="true" shouldEvolve="false" scheduleBySchema="false" timeToLive="1500000" timeToIdle="86400000" updateInterval="1500000" terminalTime="" updateSchema="0 0 8 * * ? *" activeInitiation="false"/>
<StrategyConfig dsName="transaction_details" enabled="false" useGlobal="true" shouldMonitor="true" shouldEvolve="false" scheduleBySchema="false" timeToLive="1500000" timeToIdle="86400000" updateInterval="1500000" terminalTime="" updateSchema="0 0 8 * * ? *" activeInitiation="false"/>
<StrategyConfig dsName="option" enabled="false" useGlobal="true" shouldMonitor="true" shouldEvolve="false" scheduleBySchema="false" timeToLive="1500000" timeToIdle="86400000" updateInterval="1500000" terminalTime="" updateSchema="0 0 8 * * ? *" activeInitiation="false"/>
</StrategyConfigs>
</StrategyConfigsAttr>
<NewFormMarkAttr class="com.fr.form.fit.NewFormMarkAttr">
<NewFormMarkAttr type="1" tabPreload="true" fontScaleFrontAdjust="true" supportColRowAutoAdjust="true"/>
</NewFormMarkAttr>
<TemplateCloudInfoAttrMark class="com.fr.plugin.cloud.analytics.attr.TemplateInfoAttrMark" pluginID="com.fr.plugin.cloud.analytics.v11" plugin-version="3.7.0.20220804">
<TemplateCloudInfoAttrMark createTime="1659596113126"/>
</TemplateCloudInfoAttrMark>
<TemplateIdAttMark class="com.fr.base.iofile.attr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="ba45c90e-8be2-4f3c-b060-9cafbb9103b3"/>
</TemplateIdAttMark>
</Form>
