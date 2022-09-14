<?xml version="1.0" encoding="UTF-8"?>
<Form xmlVersion="20211223" releaseVersion="11.0.0">
<TableDataMap>
<TableData name="transaction_details" class="com.fr.data.impl.DBTableData">
<Parameters>
<Parameter>
<Attributes name="transaction_id"/>
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
	sh.name as shift,
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

where t.id = '${transaction_id}'
and th2.wf_state_type_state_id IN ('6','11','14')]]></Query>
<PageQuery>
<![CDATA[]]></PageQuery>
</TableData>
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
<Center class="com.fr.form.ui.container.WFitLayout">
<Listener event="afterinit" name="After Initialization1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters>
<Parameter>
<Attributes name="tnum"/>
<O t="XMLable" class="com.fr.base.Formula">
<Attributes>
<![CDATA[=VALUE("transaction_details","transaction_number")]]></Attributes>
</O>
</Parameter>
</Parameters>
<Content>
<![CDATA[var report = this.options.form.getWidgetByName('report0');
var outcome = this.options.form.getWidgetByName('outcome_id');
var process = this.options.form.getWidgetByName('process_id');
var view = this.options.form.getWidgetByName('viewItemBtn');
var confirm = this.options.form.getWidgetByName('confirm_btn');
var history = this.options.form.getWidgetByName('historyBtn');

function hide_el() {
	report.setVisible(false);
	outcome.setVisible(false);
	process.setVisible(false);
	view.setVisible(false);
	confirm.setVisible(false);
	history.setVisible(false);
}

if (tnum == null || tnum == "") {
	hide_el();
	FR.Msg.alert("Warning", "Transaction not for approval. Closing form", function() {
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
<InnerWidget class="com.fr.form.ui.container.WScaleLayout">
<WidgetName name="approvalRemarks"/>
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
<InnerWidget class="com.fr.form.ui.TextEditor">
<WidgetName name="approvalRemarks"/>
<WidgetID widgetID="11fc2b42-a06a-4130-976d-08b082582fa1"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<TextAttr/>
<Reg class="com.fr.form.ui.reg.NoneReg"/>
<watermark>
<![CDATA[Enter remarks here . . .]]></watermark>
<widgetValue>
<O>
<![CDATA[]]></O>
</widgetValue>
<MobileScanCodeAttr scanCode="true" textInputMode="0" isSupportManual="true" isSupportScan="true" isSupportNFC="false"/>
</InnerWidget>
<BoundsAttr x="0" y="367" width="375" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="0" y="367" width="375" height="37"/>
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
<BoundsAttr x="0" y="226" width="375" height="22"/>
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
<WidgetID widgetID="9ab8d5b0-4260-4801-8828-8cf3b5ae2f0b"/>
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
<controlStyle borderType="1" borderRadius="2.0" isCustomWidth="false" isFloatWidthFollow="true">
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
<EMSG>
<![CDATA[Next process is required!]]></EMSG>
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
<BoundsAttr x="0" y="329" width="375" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="0" y="329" width="375" height="38"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.Label">
<WidgetName name="label0"/>
<WidgetID widgetID="5b682d6d-8c86-4e0d-82ce-7b7a41424a91"/>
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
<BoundsAttr x="0" y="248" width="375" height="21"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.RadioGroup">
<WidgetName name="outcome_id"/>
<WidgetID widgetID="286e4c27-eab8-4a7f-8dc8-707c084b17e1"/>
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
<BoundsAttr x="0" y="269" width="375" height="60"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.FreeButton">
<Listener event="click" name="Click1">
<JavaScript class="com.fr.js.JavaScriptImpl">
<Parameters/>
<Content>
<![CDATA[var submit = this.options.form.getWidgetByName("submit_btn");

FR.Msg.confirm("Warning", "Are you sure?",function(value)
{ if(value){ 
	_g().parameterCommit();
	submit.fireEvent("click"); 
	} })]]></Content>
</JavaScript>
</Listener>
<WidgetName name="confirm_btn"/>
<WidgetID widgetID="3c6c2702-48f5-47b1-a611-a10f7ce6f0cc"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="button0" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[Submit]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="0" y="404" width="375" height="30"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WScaleLayout">
<WidgetName name="outcome"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="outcome_c" frozen="false"/>
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
<BoundsAttr x="237" y="485" width="138" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="237" y="485" width="138" height="75"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WScaleLayout">
<WidgetName name="history_id"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="history_id_c" frozen="false"/>
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
<BoundsAttr x="128" y="485" width="109" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="128" y="485" width="109" height="75"/>
</Widget>
<Widget class="com.fr.form.ui.container.WAbsoluteLayout$BoundsWidget">
<InnerWidget class="com.fr.form.ui.container.WScaleLayout">
<WidgetName name="transaction_id"/>
<WidgetAttr invisible="true" aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="transaction_id_c" frozen="false"/>
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
<BoundsAttr x="0" y="485" width="128" height="21"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="0" y="485" width="128" height="75"/>
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
<O t="XMLable" class="com.fr.stable.js.WidgetName">
<WidetName name="approvalRemarks"/>
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
<![CDATA[Submit_r]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="0" y="434" width="375" height="51"/>
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
<WidgetID widgetID="d61a5dfd-1230-4bed-94d2-0005a75dd4a6"/>
<WidgetAttr aspectRatioLocked="false" aspectRatioBackup="-1.0" description="">
<MobileBookMark useBookMark="false" bookMarkName="button1" frozen="false"/>
<PrivilegeControl/>
</WidgetAttr>
<Text>
<![CDATA[View Items]]></Text>
<Hotkeys>
<![CDATA[]]></Hotkeys>
</InnerWidget>
<BoundsAttr x="0" y="203" width="375" height="23"/>
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
<WidgetID widgetID="18ddf52b-addd-4d88-a394-d011d47b7cb3"/>
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
<![CDATA[3771900,4572000,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200,2743200]]></ColumnWidth>
<CellElementList>
<C c="0" r="0" cs="2" s="0">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="transaction_number"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
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
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
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
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="3" s="1">
<O>
<![CDATA[Shift:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="3" s="2">
<O t="DSColumn">
<Attributes dsName="transaction_details" columnName="shift"/>
<Complex/>
<RG class="com.fr.report.cell.cellattr.core.group.FunctionGrouper"/>
<Parameters/>
<cellSortAttr/>
</O>
<PrivilegeControl/>
<Expand dir="0"/>
</C>
<C c="0" r="4" s="1">
<O>
<![CDATA[Site:]]></O>
<PrivilegeControl/>
<Expand/>
</C>
<C c="1" r="4" s="2">
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
<C c="1" r="5" s="2">
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
<C c="1" r="6" s="2">
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
<C c="1" r="7" s="2">
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
<C c="1" r="8" s="2">
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
<C c="1" r="9" s="2">
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
<Style horizontal_alignment="0" imageLayout="1">
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
<![CDATA[m<j+[PM*CYNa4ndLe(N8;%]ANF]AgPh1*1@?e;Bpc-+d=*,O=4"+clbpe/Lh)W,tJ>*;,BSL6j
PX^63%<'![N>M,ejJ)b.5g2k<-M+n!s8;o,g&$p@k]A&^U;\*hKQ)@qi$5cfZ%29=0,LIG5A,
#^T:PB7W$,%<=\?H$9lSbF)u$6$L=;4-]AQCTVb[dh;e453!)0O$5Q0PEV>k09V9""Q'2hldJ
*ZZEoae"&bF9_56e.\jMXGZ&^9_/6`'2O>nrX6HF)P,t:tWFAm!CR9jinabhF_&mDHX'$*-u
Y6i1A^BJ3&A?n4nb-gXeN3JOY:s9pm@CGS=MRX;A;T<>Y4CF!je[ig3_n$D$I2nF\pNNtE5;
i_5&i?b'>D'gCd1;u#!>[Kj8[.K$hoRnKm2SqbdI5G($;2GA!L/<]Aq"Vtfq;p:(n*l:K7p2o
J.E,Kp94?(\X$g>M'0g3A%:`OZBQ"9dQ*kh4Gn=0IU>=$ZI(8clD<G>-V9fWh^Vas![Zk^6l
b5DJ$C#"T5+73i;%)8=_N(Yn0GV8S66(KZknl)(^m4?-%4@eG7(A@F)`ej'fP:+#N^HlH[l&
+aa(e2bei1q3'>q_;JW0IR4G3C]AGLg3p<.0J<cLj4Sn$0_rs'QQ78?Wnoaq5$$H]AU;,P;Pc+
1WKI!^ont:./%$[@":)gKV@#%bik,llc>D!n`C^d'/5ZE3_?5_S"B$X=r,m0ZRpiQ-G4V(ca
V\iDOh4c-69+T/h'aqMekXo's@#*ndd.9=$)]Ai(JgjcR!i[fN=KSbZCWTqldLZudZq5]Ag#r2
mR@+Z@Y0%+Jg:!NM!n>AJZEG*,atW_m7.Tq?muPm<0i#SVf[N^65;Vog^kQYHC/GMJFp/^kd
)=dXP&GB.rNlk6/=MMkX]AVl%AQEu(-U4c<*I@qt15\;2K9oiQ[+I.0m\,!NBUq1=ssh4,DIC
G^106@<*5>d1NO(U"fp3$]A*5OhSd+*Kal$Da7_o6,Ar1]A#VId\_=O8fI_N]Aq;@M5-sG,'[rd
j*7fk&g^G#1B5rM_0jBWjW#k-7E"X6CD6@YrhNd%s`3^8r4lBmi4hKod&;lnWAn(m(#92olL
-XSJTVXDsiehtkI`DRaee39Zd-SX9dEHE%pk;=,kn%MFYk=Vdcm:3E&cr.>]A$7iD7[GH/pg5
0UFiaWSfFnI%X)c462Mmsi'a62OH[FT@=Uq'B]Am'>"s[n#Z./t@(Nk]AMIlmEAdM*01g$]AM+B
eeIFM!!B+d@j6o:3P1QlQTumNsm+r-*r.)>A/m93QES3F>E/7nYP--H?P-<hYNRkm,Q.@#aP
'c^dbr4"QHH1<,,@;?MPQU=<o_i/rdJL#-'N_]AhoY0gX?R%R82WcLg&WSeafc$8Y]A>^4#B2f
Vu=TX*6'.e8%2cn>,7S\M$o@do,r37f(?NXcK`CVha7-qaN(9)_.5K9ugZeP1O]Au-:s%UX+;
L(pg6ZOYQeDcAWnIsa2Um\r&7gbmX%g"iJ5V[ig(.0a\KeRY\Pa]A$$QD=[=jnkVJETRB"BWF
&mcA%rP5"g[n7]AXdkcJ=@rkO&g$_K\gR\<BjmBIKQ)<!%^2a/LN7<;W4eG7]Ao*B&B)muAW_D
#kY3dZ+C?G?L.Cf9?e)g/4c1=3O1OLt:en@&FA2CG,>11(kL>[l2,6*q>du7h%j4bO<?Cjt3
I#$$-Ug@+/c"JWFF\*T_t_0>&a.7aI(lZ*6)g>TgStO_a;?mjZu.>C!X&F=:Y$`gHo2#<gn7
nU6^h9:rWY17iAje?%B1`p$o,cZ,43tW*6ibCR!_6UB6oU;8?lP7<5EUci%OikXjPK2!Y8VT
PJjl0fiV"_4`J@lH&&!##5LsQcKu9%B4)EJggGRXgNOo7?EV5Q%/;FP!#kK"hSX6*(M)Ri-C
tNkC"A:!geDP_(iCBfo\F\<6]AIi?eD9^Ee"qs'W$%F#rp9`8Xs%9#XrWq9om$q]AB`>W//k)1
NUr'%sd%fYEs))!>j,J+5QIgGqifT\4l`7qB4W*SYN.j$Qgq7:q#XdQD34']AcBN_9Z5Z_d!\
%M\$%H5kr$aHcR3.P&ElD>*01R%:R3Zm.U7_NGJaRZK8`%>L#f/haU%J.*="WgLb]A]AI?G0@f
)g?0(KKd%AZEs4b>)S^^mOe[nE(H-$2U^t/OI&kp^D0/auK'?BOc4U-jScO^9;J4"a^O3e]AM
kg7"8p,p?_TT=P7(Fp0=XBN$XWNCTX?0%+3RWSD;\GG\jF/r^29'tTphU+W=UX=):_GAVj[p
qgSp.P(l6Pq%G=JNUj%JBG/RS2b#'o*/1'`<_"8K6t\`J7Sc.FURPqed/j`V0q"@MLC'Hi*"
k.+0%hKrY"FmY!*L`V3B(&]A?&@0"#h?^\p!ZlbQ/VI13/HN=_k$3n4_YeU4Y0T=B<U[p7/'D
AWA;CjUY&+*G!jEPdk:]Al&b3eJI?$0,G_LkOn2sAI34g%dIm&Qhojj:%n)r36b5"@6b]A)f<C
M)WLQu,U_JN"Jr>[V,?dKrm,3D[(81N$f,jU/(gpF!f<#Zj'"q+C.GqjO;t[=;?3#,0G0<l`
nY2;;?9Oc:1#KZNM<g-_+LlYIEA^X/:P2?uYOL`OPQ$TYQ*)e[i;+O!fqKcfB1gIhD\,74JW
Xa?[<2t._,?jG*ZJ.6hjAUt:A+a=Z8Yuh>2t0)p2]AS2DgGWm?;:4EQV%^B[d6eA*5:+sAoj?
,Mfbk%<N>3$j_I;:0Xf#.56_(nW#6N30UA61HElt&,u4mX.WOo*PMW\t1[V-]AL\@h&U(M2HB
PdZhVgNrBIeXLZg/"H:-;1kueC<R,Fqbp<c7u0Y6;^rS8VR23Tf-_$!Ha4ap<^^F7DfqoQ;0
-[At:\*%V8=-SII;h@O?76?2OO#.[ZcPYM4B8%,,3q1;KTk[2%k$m+RnX2WWXDc0XsU6Rm<:
B!7NVF'##R:KA\defda=OE/uo:<*>rabQd",!S#K8TG)J,bI'TCo,C_[+OF>c(*u<A',b5=u
^uDhiIS4;J&UB]A@.5CGtha8[qa\q4CsBIJT`R3<]AZqXO.AAl'/\5UE2<[Qg^rL-fKW%%1XNW
Re<[6n2`(u@9Z3L#Fg'F&q%+pM/pEtpIXp7?Tng@G,\aPW0gdU5EZm!!R94j53Jj1nH23Y(F
f%?BHE[a)/#db/%!86VCQ]Au+Xl8%C?8_GTo>/CC=.)D$3#6Gm(LJm0@9RFtcaEL*E5[p+g+l
5WMmB]A!rU?5(h]AWY#koD63`*uAeLh$oOBMa.=CkUog4g,U,=./PSs2(7$OV&#uhR,cU"$R7l
P>plM=ad-<5.A-q4$E<7qoulTQX;/s;/q"/,0^Uo)_aQ!651N]A>@d"Pk'6N$>JSff`krS47p
oBNAg)M;]A18>Jk[*Z2)3WLTjA%Z%T\#)[TlXS]A$MJj!&e:a5ch'@C4g[Q[:"\"YGS@^OW`2N
_g1@Mf<O`L`[XFiC.A-pAS3p),:oc>f:8GOX>q7cNI=-C!]AI16rI;b-k)Y7ElGh;YEG'^a2e
+pPbd+tp@h1P+W<c3M6fV>;<C?C;(T`]A*hHRt*7Zj8CAFC,&D.DL*Q`e_L$)P3*ZJSqfr(j9
]A30/U*a:$;tuGMG%3`[QA!JQf@&7g?Tt@)a,B+*FtEVnS<&Kb8(\@M1OT8e!a%]A=V2394uJb
%]A)Xtm?i+&P&Ou:mp#$saKnA+]Adg6!p<r>F9"[=L).5/N1+I\GV4fd0k0"R;;XQ0_Q>bEa:Z
'0K_fkeEiS-I,Rqh$0p.tU&5@T.!mJ$//jOL-,FG9W8Yi^A>6?0,ZH6E*;`),;*af%WMgAu%
#LtC2fTp?;d<;W9D)R+YiQD"@Ba=JHPjO8q>&I`7,9*/]AK9@JaIo"$&?b6PWu*3\DRQ6,XNP
#+\21?h?Q3Fk:mAl-[0Rq)3Rr(+D;oCB%iR<OXfD5K.rAmMZkB=>A%1CoSm,0S/LX%+6iSC?
$0XfSTT\=KF;1>:eU^&7eZmeRQ6&uPV8Fmgt$9#?c+^-O>p]Ac%Hoa;g"O`\"mKG/VAN[4[t'
<!I<F"`l/,[,/Up.\^H>'bsq4f.g=8c7m1!A[-0CeJb6jQM8g_LAQktAGPD$%L9VRVeUJQ_"
M&W>GJ?5)2G8Y"_KiT`")12`gI,K6sR-U9[(UuGA_:j<"=54\-r@G_qaT1HEiQ2lb&.)DQm%
a'iCXQ[)pGTr)^)c]Ahou:0Yfu"]A=b`s*#10mr)S`8hniLPSq]A5_pbk<c'HZgu5Z:sUEN?bf>
uqi9KhCG('#ML:A0C.7@B^IJ[EX&tre*"+nsUE*?Lhlr5%l#t2`R&]ACcSXUPIL"Zm't-ul[\
gf9ukDln-maMZB`V,I]ALYGa0.hRH@j7i7f*gT?=0T0/-tfNIXe[g+4W6&?Wtp2>Pg!PN.*_8
FKGH%;d*FaR'^Jdc0uslYC/6uKfnbH?9o]A@Y83mIZqhMQ(]AjimMD,OONWaK_7iX$;>Qrup*P
C2sk[!@b'(RYC7ZYV?@^Je@Pk`Q[NqKih[^F.@$='A-PUX=HZI9*Gdmr9LT7Xn^nl,LUQ;"O
tMJ($-l:a#Z$.Z\D^7E%gfpP?a.84C+F5`ODJdAO;Is<ha<H!9l^**=@QW[WU$:_0e@Ege"_
*^*?kdhNrVY6q.'V;7n\4\q^5/e+5f`hF9'OH*L\`De,F74A5UNQ4-^6ZfpV^N5$Q,`;E>he
Ge*2'F)*TqGLnc$i0HOFd%%1PQQ$HU7OY<Mk6h^.<sL]A:I\\F7iI*>d>`^;%"'RY5W.^"P?/
Fm<kC.q><S5AN1=iKSB.Q-UPDZ&WR4(s(j7pM2j6<X)AN;q'1Q<N`I'G$2/t08%M1I)<KUT8
S3m`ggas#p!7t;F-jV>14P;*`<D`.c\j&p76VPn,<-Tm5raaR-.+Sm2.N6Z_d>YQS<CR3`r0
1)lXTEc!?5JJ:Xh(Y?n>Pda2rJC*>tp=(6N7iFTZY>H<'s7>RF/aVc-.S$=._MlEBT/!S75F
k'\9(.N`LDt<@<q"Lnr@fXu^ULdP")K=.>^:LUUBDYj;j+pSF`E#2DIegY5*lU9PV&0X0i*s
Gg<M4tD^:`7fDL3.2.Fd5&HmD)8XY$UoC0.*%N^%>aE'+#sF+'QM;ot.WXC/Y\T2=D#YQ&>'
SueM,.Qa0[eQYFM]A2p!MYT9j!."eh&Q(LnD_YW#6X+G"dhXu#BE"[<oJsunjlZ"CU\1cS%NE
hf.28s=aDfPCkIUU$iC=@oc\HSM7%)e<;*c>God"RXO$22d.$kAuY4^0Z=:LunZ,i713Rk9_
PqV@q8;!#9PTu5kWMM/4I1A$pY#7I%`:`5E4I&[]AL#1c^%&M70GZ@NZ1OXYl#J=("K%4"Gh\
:;<*,'C<(S(fiEj-+[F<'kQdhKBa>hEaq(6-W_?\F\1i/ak`@gVQ,dCe&q6W:0*o54S.H+pQ
\#/#*n94+bTj`]AL/T=`]Ah/#97f\)WeE>9cAQO[b/C\,:JW6BRsUq'gL0T'X!h*qh`l8kB9uc
Gg9pBPYWSk@Ht'-,JG]AaJC70cofLI`0^)<OQ]A<,:*R(?SF3dT0'\d8n%2R3DSsE@qKMB6j"p
8s&l25gS:\TU;>]AHp92ch'D^"BBY:6\,0kVN.VejFWfHtN+\7GqD8S40sP_T16-QQ+Gmc+W0
a.un3_ciNm+i1%TUB0R<ulfdj0EGua/Tp*+6L3TW]AP4:3kYYqs*,gURo]A*SV5]AS^rTZ=cM/.
`VX5H4BX05i6Ri1:A3OP5Bj%+(:NuibBBn.9tMQ^h[!f(fuPI@9DpUWI:'!B7R2rb0A8/8Ha
3dm,n.!>tX0kr<@!$i-:`C[K6q4b-f7DBc9aea(Pt2#ObK-adXL>=t`YloWlok.]AsDVR##24
i?,ZaNJDYRp_i+T1A<V!p0rX<_`l)b@eVr!eISfaX*TQ2J-,QV^BHcK;4O7CoqE#%qG?kX4*
"N?<Q.HnE`u5GO\3c&+Si"9.A1Cs@tP+"bg,0jD"UoWQ[g.T]A/P@56Ltu4r+TkW4J/h(Gc28
3J)>o'8%M25gS@%I&=\Ws7S&5Ne[q)WO97<(E;$VcpC,3_Xg5c>4usIC40o'kRNdKeX21.&"
r=E<k_4N#j4diR>J$]A-U0?LXnXV8gfg!*KbL:@nCg*Nnl_j:(1bDV<Aja/fW1E.&SF0hQ$q.
G'P&gN3Ce"F<MXc+q"Br^:Y53OX1.Q&DFtjKsAoEAnB6N!a&p3s_<"j6J.%#\L:5lt.*#o53
S%%da;cG*%ZaY9BpVBQ#Ku`RbqQq\2?7O5"")?>i]A[O]AYlp)4-$jM6.(<>Tm<hZP"$'MFgak
G/Mr]ABp>S[h$tBU:!)W`Ge"BmmT<4h1c\R&eN%BmXG$f4"=TZXVi!!VODrEcMn'":C@n8eSC
k`,QuYN(2iRdEUXB`c382]AAPCls.rpa?Ak&I7g-X\>J4#*-eI5ZmF$QEct6?NCg9W&Zmg0hC
2H0qR<RoFk\YWd)&Zco)g8#\(mF,P>G2D>in=.p?n[uV#j'p[fh"eW1+f[)5ej_Gg`6^_l'D
$IqIQ"4Y;.jgattq4%BFl3C2([%kLe3-@,/)fih(!^J&S`g5K?F5o;fAM;?jLulDY_u&Rq3S
PG+D^N!5cGH6<*HF8ZL%PaosT+'Fhr\Sg%5lgVaH0$^$Jp,c1W/ekZAj4JkhF<Vb<',:%_Y^
b<9$aI%i7onQ`_a/J=`B&O,0RpnngiS.,:;G=,B!=`&!_";L%]A=fb"Lm+D6lLK5O<,'DibGR
#]AJB-1jMA&CmEqMB9psL@TZsOSN\D8&Sh%G3h9XQhh=+aY/-,*Td(ct=%3Kjsb?NBuHX$pML
#*b,K^J_R1B>UCSJBVIP>MWUY58%qC$mp:-h6@6SVRMkU=`Za:H6[sb]AN`kM1bXb?KdeY+0g
f5H#Bb,j(s\>+e+@;-1^>YkMp]A.7\FZ*DWGWiH0U;rR.Y3a,L/tt/]AVi0KmdoYl.?C$DQ'S6
)]A!b]AV1SQ%ltfBf=(*dD%me`<h.Z^N^a6NEF6/7MCId,Q;!kA:B$gl6\l'nnQN9Q)muXKn""
2i1S2T.$>B.YhoU;9gPs[7V)Q-UpDc&*(-df/jb_$8nFn)-$KclDG4Sm%H2O>[N5[Nk)hrAY
-$X6]Ac=AP8@Jt%s'Wh<:=V.D$R5&j(7<bR83+iTdaA*o=GiEPn*1NXN,)8&\$Z]A\n^;WlFVA
L68/a>Ied2$iW#<OVlB(!em4C,!Zp%Qg!(hu($PkD_J\-Bo^7JKe9*"+idC-O&ZFI9ZW,lZU
=iV*]A0ddNBCPH6HD+%q"\,%[6bXj+;-!GJAofHQ2N^K>i*_g-/G-[:dmA=I8t0f5J*.Jn$)-
]AF-"fRro.hZ6C!?m?ZNFMqaIIQAeabqtp4F2faqnXqc4GmPh%m=F-"e[r%a?E)A3Nd6T&KMG
Hk=4lB/Z\e<1*TWhr8kl]AB]A9$?YaS5=?T">Fj"mRfR[$8i]Al!f#sFLb1Qp\;^E`UlMbbG_&r
C-,6^WW@rs:^P>>V?cX%OZd>,OZ3EmU*[S/G,&1<<!t3HC/"5s,JS-$2RVBspnE_JSRD!Ilk
j">A'-<kQ1TP8PX>B706>H?.X4PUr.pH2#e0cOl>>O.>J*2Us>APfc0++Ts7:1F"gpRpKi%M
s3mdKNPZ#b(8(Q1ha/ifLZ`*APpAD6\ok5LbIC]A*Hd"Da$H2ROUBSoY$hS^aO+]A1(nH3/c$#
eLV1-:Ht11;DdgJQ6#M[qX8]A2aKp"!N<mPt?/q;$oUPQ`k)*_em@S$%s%Ca"jSFCWT:Hd7oV
8l_=7VqGgFG>"jo_WmfT!)mG=;-L1Y]A^MkcP.jDtDW5\lP[pnIKSf4!HF*-[j$g8Y###<p*Y
uFras-Qr[H*d4ifVd'W)[mkM1$/f-.j:D0C(iT!rR1I[o&<^V-`qjhS4XJUZk/u;%?YY1\KT
65/(fA8osJ^37A\5/&nZ%MN&cO;p!r;\12R(Sc.Q`$<_M;l'u_,ITZTdH,`lOEHt5(9Rs$Kj
!\T$5d"`?YSVb&5JNA%eS"nU*2u@$[4&'c\(Cp%!JJ@[G(;Z7FP\#LVW1$O3/noZT.[f_P't
r3[1(P>B$WeF%_L<Gug4<2t\NpYD^J4/GH+E=<di:A_kbhW#Lo+Zq21jSe/TST.Un*+[,#o6
,8!$:]Ao]A&'kTD;gS+X`M5p\UP'fZ+OKE;bTYBV40(Lj:Sj3t4MT3.-Vp:Lo)s]AVk@_u<!iIL
O`p&PS.%^\s1<MCO)tX9RD:+]A(&Q0CB')QN,*qaMN#Q]A[)LQAiS=:<EFinaKKZ?h(1L?>#'h
P)OFN"3r)V["1nja:1ZK@VE>D&+k)iZK/Eq+bWV%]A52)/.`l1h\e%f>kO/?=QDm11umG_l6Z
S7&id,J5c\DXH>bRP:iO2cIRh4=m.QE$AQJg:7M,>"CBCF1m%,o<:@2f%Q`6Bd=U3,/<ddq?
*pq7XaC#6+O:Sb3HD"fjo+3%`"-eq.0$$kuK(SP_<T^EZ;F*_#moMI1^10r9k&'%k%nLKKC\
WRV3$@!HHaLG0./nmECX'H$5!9n--XPt;g(S!^O#d-*4+?j7bDC*7G[o:9DEh@$Bhl?naM0j
A^F\m.[/i@)CY&$Pi.,m:C"[>2Y9jU):0h1l`>B"Q]A1I)"/1#EaY8Po(rJQg1KErb^I=q0a.
!3f3jd$Il`'2Ac/B@66S<5>S+WQJ[ot3nF.Ad<gW&Rg2fQBGSN6F6!D2`/uVIt%2=f,u`,s<
Tf4?]AAC-Uh'n!$4;>\$j'FC.ZF7V]A6amgt5CVJO2Ba>J]A`ne&eBnf#)iJM[ocSH`on2\9mT]A
UrjnG<<+etPpts<cVnc.!+R1<.o_-MIqbi^hY\ap3o<*Q`l]Acjj5>n)WWC`W&]A-%0X27(a+@
IF$#"QtZ=87pD!I&*sAqLk;Cg;$;Lm_mSbT(c['6rK?inW:Bk'jm_T.tMeUG.6+R2\#>8(iQ
KhU0:&fiLF4QM*+I.Et0O'VV`Do'VN+d&>^@9Y6"sq6m`?ra!t#.#2j#+kDk1=7>u`QLSk]Ad
*l@f*#mcN+0brKmU88JAIg6@hY,>spYlh?A(MoY3W)Cc:8An*OQB!8nM+"'F4\u%1OrVme"t
#0##3riP^L`O2lN^:,g'EI92`->J(0Oq[J;rM?a3i_(0ilqL[Y2*,;Ec\%>daU?,'D^GJko5
1>$alX0/>ms&WbL.DS#']AVS]Ad/C:P[.kN3,]AR`5c<eiFXjaU7S^=c"-_4+noJA]AtJgOHo/oQ
u;OR1oHT1eNP/5in5#AQ]A**K@G'dqHcoK)B=f#KGQN_gg=^@U>HW5Ag03,rJ(XXp?J*iTn^Z
`l=;/\OO=YH\>C9ef#6D#CSQ[heF";-S%q[?jAH19AH'ZkHN@!b"C$NSKYql-9$p"`d^;6o)
k<e\p]AUfQ=M`uc+WCf+>sCadCo!ktkY1NqOftMB%f'MUeZDQ#i]A;=4JT"utinO;@e"r^=A-n
AO\e3lX+sg=#C#h=nf5%G8[`;6j^13$[E?U/M&?0IINOX(k'fcG&!12"[U;UN)%afTH!3t>V
Sn/T_k>RC:6W?As=-`NgX+G[GlF'pA=KVQ$`VZ7ZXnQqM"#"h!lkUoKiQ&QUI7t(;U.!qfG_
I=()=fsh55e0K+nk<.mR.O%dP$-RBh&1*WcYJA'ud>ShK')B?%qV$,C*nBc_"s;@hGlYjL8X
+Vt#<Ns/5q`)VZ@UA,t[H#(2j\*j@c[g_X"r067KrKQij-KWt&e^Qp[W7rPi_+7+obP(t,-_
btCT7pNIr_946Mia^e.cqdh?Au9_lm-2lnGD8jo+ACB'@(IEt@NVBH<Xt!KptplY;nKc!/BW
%W84"!iTrX[!G$mnU-7^(`U!gP5n-iut5&@rJWZd;6qDO/UinLHC*%K55J4]A+&?!3.DkhcD[
>fq8ofF8.03OQlJ[;;OH@SY#hI3J;t!2d-Q5_9krI9DUMFh=G0g.^@9Q87J52+>ciWStGEeg
s[-2>cGaqqYm:W@eQ")h!0H6V%eH&c"IJ6JtH(;cd:EED%/t`p.*"D2?<j^k(bU&4@c`dOa]A
@#NQVG`MWjm3E=uk2$43N^t;^<^b[j8GOhRL33I&c&Z\:]A`&qqGkkL5(Dc]AMj$qE:^6@i2fF
9uUl:;te(]A?]A9PHS*!_#6`)TZt"9POCjT;OerGf4<T$j34HGOT/rB=rFh+'6<@6=H&;N<2>n
^VhBPYo(S3*,$,81dgI>?a\\:BXU$)Z]A.-bn#?nuPIETW"PirdSL9*i9lal+BW7;4L\aqA.3
*2pZi:VGBL6$:cLm.Pu[p#\-@rHp-3m11Jn+h=HF+(:/i`4q=Apq4>oieVQ=%$T&qJO;`[Up
Y,?gpK`O>=#3BM>L8-C';So\&"')U&EBgb1c_nfjh2IocS7)Ue>=`BS-2*>EAPc;#ej?ee>k
3"clk(^>/P:bnf`5aA(9^RB/hC?@V%DUbg0&WrF0!8$9<BH+L%d^OX-jUX:lTj1G0I!8m"XS
j+/_-ZWO3/;/q0CRGfnX\6<hH2AtP'N/,`C]A-<>j\OK"?M3'&/Om9e!e2fl#f,q"\_--]AlF8
tPeMgaNfCg6Ahm`VeL2f>sJ6BK^9T<k1]A<:t(WN#.-EKR07@^gNPdI:`'k>UNiC)?-[mN@3A
j"IoDZ[7Ug>`6?Yd'\>!T"!2CeKFO#H2f76*ljO8UL<VgIFZ!BDNX['[%b$lY.9io^#>%H@Y
?$GFD@J8]A3PA:6Wb]AZPR$Yd_St"jd*"K[Mg!-l1H'HpR'b4eSbY)'P^D0[dh1R^\U>dpZGH[
*$-q/0"!dV[<87ddZPr)*;RPD2^8!gu4Vb+K\M'//.0@J!#e3hkm0%/KWeuD.HeW3Kb**&Kn
cVc'V'j"p^*#\9p#aQmM5#$]A1.o3qIbs2X4nPg1aDP&sf-FWi`1%3OW+8h((P`@G^+pEbbiE
lF-\8cb+*Ze`RF1!`o59:=Sgohe&oq/eL&hr0nTFD?:A6O96Y7o3Ko3ES;odm67jBtI$or[?
,d0)YF1=1#^]A^=b#E[E[Y51")(0a`d#(O]A'FZ$-OhIj=DCnc-o\q^bHDNWOYO9+fjj,@/qj0
U_8<lrk[npsuH7`Of4+Ca_^[6I@:"SXoT%*r(InX^X@0/"h(R#Y@C:H[7\1=)UTG<(fFhC`S
+<%8W:8;a)tCGa`jF%akU,;_VWaoQUS2%=P0)*&@A)qfKC^EOdD?<ka=3`/Ctc[mV`%[KbK$
!n'`=0Fscaoc,TS<7Z0R!U\%f8<Enr%-fiUhAZ)EBFun>7@A>^E_Q+P2;C4id,LK944iK^*.
n!m;:WS<c3)(rDl[dobW6^8f2fjf"*nPot>,c2csDM_&E%?pVW3M:I$)5,u!E$acL]A"LZS"`
o;fs/0ljTHf[XQ44=KE\:?]AJ[-Ff=WlRt)m4@CX`8qqGi;VAi$9g2_8C(6>HcO(YQ7(qnXP(
2oP5E+fa$s-eI+pbZ9d3V8WkrSfaGEPX8Z1pY!%B@K5K1\CmG,PE/UaLh`\A$>^*iroE\VGG
(YiK!AbgSBR*su7nKN&q3qPa^T3G#>2U/"B]Am^(0n/1"pR"b309/K"N8>'8\"btpa5eele4$
<K+>9!dt="qQ-*Ms6DfLFl2/T[4UrilA54GZBp-QA]AMp93ag1Cbdb;^l*NZb*Nq75='Q%8Nm
)2jZ0TLiQsbtTWeu64Y;sUL-9->He8Xu9QQ!:8b*eTnq"p&@-/1>?d##`EA(VB+AP0U-%Fdl
)?6Y,*6I'3aB>&V=Fk5)+aa$)Obd#2`Et%:6*]A/Orm-4hX`Ja\_ro&^!%023k2R1l,8AX'r)
U;Jr23''6AYQYPt^i=)pQmhX)Ig8Vs%J(/N.\W,UtU6es`lQAZ+RN]A-CK#S,_&4p=?cAp<mV
0j/0]Aj]A_5j`CQ51BI%s3,K8^i`%O7ofm6<7>&XE)J/90UP+'\@c-"hap?/3-S[Lkm]A(5G#GW
2X)IX<m9Sj%">3N`0o,5t:JUi>C^ue>li8XQ<_hY]ADq4>gX1XESfkDL9;(CF)#Q*'o16SV\:
@c'%RfV2S-$ILV&iQEicqG-Gj/Q<"8/<@SH?9G7XEHnFSOKdF=]A%3<dambcuhf?nffKmPTkl
`b"C^6.g?S"i>QDB1&1AgGS7GG)j"BE'>l#a`+5,eCj3#K/i\,X'ICU:%%FYZqPT'QC1R0#j
YgA+.enK4K`!"e[5ROorZLLTQUQRBPHu=>>mE%:/T:D4Qd$-S]AC#;9-!^Y)QuF20^>=5Y6Pi
`k:-UFC$"H^o!%R+bT39iDbuk<9\KnZ.s&l_3T<elYYO6jAfX+ZqH1g?rj1i>WI3iWptr&%n
O[3%MlQIbfSNo<=RTtfmp,i0`FS[S:<"j3km7/9Q";7X*AIDEq_%OCQ^OE`R'8P#lig3KFSA
1EE4t"BO:N`4]AWbn=3@`!$`?t'AJV]AWlL#+_]ATB3ES]A'8iARM]A@#92>aIrj\\A[SID=3r74)
P"M&tND=A%?r!IEOASpCD-k<$0*npnHnS"Y_B"?@pMZIKpJ&cNK[+CTB\l"ueW!<!ZEgd;m]A
N^]Abs4eP`3JYFlEED,agCqPidH&2GHPGa:r'S_W'r+Hijng2lrrsd\!HkFlR0>dg^?TMo8m>
&j.YpB,>\2b$N;BCFnd$2AC)rZSE3e;^lbrV,$Ogmfe^ME2t(_&2Yacd[AXW;qO`Ha`gmQRd
XS3A>TOgWS$Uc"XK*(Ml!:"H`P]Al3Dc@rSV$o-K7cWNXA5M2k$:@.<anR2\.JncsJ#:XLF7F
*o)'H#;1;"09BBoAL):A-1KqIh]A7U]AlrNO+X`S7dHmq03)LZ8alF4\Q?+_(K=V3sP\,8;'`8
:sW)I@=OB;!$i2qjmR8J(:n58C,aEG2q8?G`D`Pfs+iu<(TU%#5)X!F-pl2*r'59Aq>*t=S.
03WKQVbmYm>77IlR6'8<F&n6uW?d0"h&D-+W0Bp^kG.>,7/kf4/GaY]ADKuB.PBh:V".GOtQ*
Q.g9X+XX>_j)3%s+O'O8$15(;U=8_AYpoH.c%@%TL[dC+1P/Ve=#*P@X3W+tn;W]AULKbm]A(k
LIbTR&`pB;TkcDf-AB@F3USFLFs>ln^@aDgQM)U0eoqVo@0P-a3KFl5Y0pKJ+ieQ7!Ei6G%Z
9NO)&MFGp%2"<n"UaFr]AE_^s#I)`m(>uTYb&B"peE7A22T'8mZL>cIVg"!M&=cZSHB465e#1
qYRF7RQPC9YC/;_2`J3&Tdjun7jnrhQ%IE2;,Vs>nS%Z<rKe=sXlf"I%+oSmH`gIW\0<AA2+
rQ^*+OU.q65>R.YFD,U_hO<Y<@K`N)q@rl>l/.@s*j)E43@AgXlI9<o!aWF-VB9(+RY)o"CO
Y0c'(<JXdj8J88-V4ZhMb[1b>_9>IS>9r7[Kps0@$5kqaJEdoPIFF's^3[UI-1N>E8;Cu!(B
J7$@P>IpB`Mbk,(eH##JIp<I\#]AHt>EIi150DGo10[O3CYXEtg6+f&$)or=*AfnjEk\>Qqnp
_*"0\6b@mVLcTH<gt.b;V=_i,1R+H74U>`t]AB_pK'8URJiR<GZF'AL`BcCruWm\L%SrH0d'u
1p9tL+1APC'fNF!5ebiM4hmd!Hcf22GW178?Q"to`a5-dHeKhfC?R><H_f$1'=\\Q5n-8*T_
@D=iW&Ka*OOK\U_*6tnXp2jL<70?F-[tB:E'a&_@A]A+j.$Th<g<Z]A3%`Ni<[RZCZbLX\]AejG
@QHcQ1DZm&>mt+Nf[<S7XV72/;.Xi+`O6+da=p*"#5+thm3kqu21k8FJ7k/bG:[JUeEcGq#d
;hKHU&_duf"H\=aBYrq+JRu4P2Zmp.(Zld:1.tE>Q=3)=Ib&%ek$6;bB&AlaW3Y$E8K@(gYh
h4gFsI<:+^X1iGs:\P%[L:=NEbgL2E?(L#Lu:AS(d,*RW(CfHN:_YNfpNl.J9.?(FH[dVZG)
GS<MrGrCK\>0JuH1=;9Spes1B&YcE>gD)PArLgTt9l0$Eh=UP#5!<N2bd[PgnS4*^%t$8ciN
Z%JF/"KEggA]A3VC(Wg#T[FNK2hURU]A#>@id?uo0YT!uR#)4BYJr@SEF0)D:1IGo1#cWJW<;I
<.a-\jdtGl759_"R>?">4d[_b>*6UiQW'/H<)9ETPrJH:paY3,"ria4#j<c`sp`(e4g&mDbr
$]A?AkXc7c^8f7p+o)ZjOT>`ZZZ/$/2rle]ApTM8'$@_Ci'_3A9meXK#&`Oq--crCEId;YYggo
*OKrj=OL.p,j2']AH0HZ-=u:2ft:SbJ;Jf?LpV;<c@bKuG_E4SuI0AHH_Pb0ftAIaFJ5Hglo(
f_Wo.]A>$VU,<c`;UP2H4Xn8U)+o3htH::;u?$b.?UZqA1:*W,ML[rL6jh5r]A8o+)I4b9c6)E
/JdR@Ai:"/hK5>@gCS1JDW]ApNd;Z8@]A:[gM[FQIppO-:a2nSrWoEJoW=B$_[k[3NsXuiq#u#
)."(Qnq+qFO<BOC<`r,j+bP8saItU:,[<#qOA;3;lm#[2+j9FZ,mrX\e_Z:-$'O`,ekY2cbd
2DFfh4W@CGQ_8l+pP<e2mZk/_*")8h;6MYBcq59&Ji8)`ti$.i1ieLW=4os_XkhCPWkM@,Mp
r-[@AJFg,YiP6nS+>`#\h"P<=US`@7hSJN.t%;UGf\_,=&q@L%6n[sW%C:GWp8piqt#,Cn40
Wj9QJoh?C2.&dZReQlC2T:/@K;tYa>Wt3oFb':j1S*kPjSeH(=2?Bd,5U>IZ0rKfP#$1uUY^
:3@R``/)2,KV!KffSm_sS6A+q1&)?M4_3ppupAW$%;-Zc;QGn$nhQLk\I;LF3G>lYn>^e)+p
aGN</0!#I&d&V2[g'3cC7=ATpJ\X!_\5T6'TV3=]A&4%t0f=:D7^hEA4bW]AIZrQFVPEUI5D<B
_@Q9Z\?X21WspGi3":X0Sue/HPNbS"nbTcC"Uk?A-nU<WK<H!bM^RZY6=*2M?^:+&M;i@KQA
()ZtqIY"2/OJ"&X0HlV-hq9Z;UN3i=GaEQf#sW!C7Dk0+54,%JFSr<S@63PX$30"&_r(#kp*
"mIQ-5U:BqQlB%iAn@*]AQ'IVt_t`#gfn#n!on`2oiTaX6q]APIWBXjb<>S;SVURM@l':Z52mg
LVSH:297pSqc70)ksD-/$V_eB"HHK6SbV[.sR>mUl]A,k0InXTL3f@mf@oI_qkX;L1HM"AA1J
+=huVUd@gc#q"(<kMfoIs\ed]A6R9k'e_=Y#\Pj!kJpSB-9,6ruuEnaIFI`$[H++(W3RHJlAJ
(W_)bSZIs]A$ZuK5boEDWdQ"@5pMaj->IJVqof'@0#->H0laA]A+'Ts&7FarCh&g71PJ\IUpo=
6=?rWndgC>rX+dGV5P7_LUpYBTjJ!cFWbj8MkCkV#U''(_BN]A74R1a_sU7dS\ZcsYgIFdkuR
m$;ra#(5Vh#mYf1*,9/$^[0K%ILZgaRt,:Za;\8c5/aZ=I1#sjkrRhDc$Q!Pc94$Q9:LMk#*
n*[Rj;]AaE>kl[Hqq8sHS?.=U9?E\'mC\A2G`rD\J#@=V=dmhpn8t'_p!PE#m^fUfVW,'9,*L
)#9:5Lp>`",HJK*(I6m6>_Tlu.l/2_oA8Y52P)R\Od#2s9Bdg'H]A/t)MmrPc,dM68e;(5ZsW
-l1,;qko9&slrBdASaEdlAj/mk5ff!]Ah?"O2>Va$csj\kZ;dCMG_da:):.W-umaETFX*)--=
VCB#ZQiOmJ.MPf+2l#;?^adJCK'\>,.J"qkM'_<mu8hI>*f^,4@,*h,*./_e>H+$@D-Eq+2>
Z8U:&`]A=<FV0kJRf2DgG1s+1PHCC#u,cP<)$p&f96M\Iu'"'%(q[LbP:J]A<We&s6mE2Y[P'\
e;unMP/TN-t+0ec]Apa2b[j=BGa1V7N0#hYm(jU"1`3=<@;T_2`>\^]A#B]AV6:m\..O193#?2U
D\/Y%_'QaCjHCT?J5!Z:pc7L(f<+=r+R6aOg'bD-m+dZYI%TLt6SJ,ON5BVr<2iRnPn;(^L\
.Ttl;emf[#O+*C9MMG?n["AN/2o(oD'bQ:?!:G]A[f!<J'*$_If2[I?)m6]Ar'3-t+(&laV]A1d
-E`.uF5#V#9N29TQM?K%'XSFrssd/WeC_e!-@3u=3lEeVBc(Lh`-FMi-[p[shhbN*mO;JA-a
=J=m+F%gBFnW/3M2J)<Ar#[SFPfWdc%pSB4s4=@Ia7WI4[OLPBA4eq4)2WjT0\-:#cQ>(-%/
e_Yp^c\K(;%#fh(.-8Il9`E\``F*(JL:tMh`IA(#XSXMLSm'[-%6sQWu8*pp2DXPO&3miGZd
5gTeIp_1tC1g]A\5g_'k>5j1>(WV1TF%amn]A"lgOiDX_hFroPKsbqdQMhnLmO3qXX9?Y=#e&N
qR<*R^0R^R9q!uZ2scVU"#Ddbsm08#0SZSrc:FKm'8.C-sr&5mN]AIBf!ef48ZR;YkC6q6pXf
EC@J-ARZ6>k6r:-B9*`;sVS\E@;Zeb8eXnWR9s.u8(ja;(8fRIYFgHB\n[hXC%p:msjIlkd0
:@blXr9YbZ43?ATo!ah\m3I0Cakoka\!-aW,_%nts/M91J#HgO*mVcEi/,=uBk*'b"ii8br'
(~
]]></IM>
<ReportFitAttr fitStateInPC="3" fitFont="false" minFontSize="3"/>
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
<BoundsAttr x="0" y="0" width="375" height="203"/>
</Widget>
<ShowBookmarks showBookmarks="false"/>
</InnerWidget>
<BoundsAttr x="0" y="0" width="375" height="203"/>
</Widget>
<ShowBookmarks showBookmarks="true"/>
<Sorted sorted="true"/>
<MobileWidgetList>
<Widget widgetName="report0"/>
<Widget widgetName="viewItemBtn"/>
<Widget widgetName="outcome_id"/>
<Widget widgetName="process_id"/>
<Widget widgetName="confirm_btn"/>
<Widget widgetName="submit_btn"/>
<Widget widgetName="transaction_id"/>
<Widget widgetName="history_id"/>
<Widget widgetName="outcome"/>
<Widget widgetName="label0"/>
<Widget widgetName="historyBtn"/>
<Widget widgetName="approvalRemarks"/>
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
<PreviewType PreviewType="0"/>
<TemplateThemeAttrMark class="com.fr.base.iofile.attr.TemplateThemeAttrMark">
<TemplateThemeAttrMark name="Classic Sedate" dark="false"/>
</TemplateThemeAttrMark>
<TemplateLayoutIdAttrMark class="com.fr.base.iofile.attr.TemplateLayoutIdAttrMark">
<TemplateLayoutIdAttrMark LayoutId="9ebf6aff-ad53-45a9-a175-9633f4162a3a"/>
</TemplateLayoutIdAttrMark>
<MobileOnlyTemplateAttrMark class="com.fr.base.iofile.attr.MobileOnlyTemplateAttrMark"/>
<StrategyConfigsAttr class="com.fr.esd.core.strategy.persistence.StrategyConfigsAttr">
<StrategyConfigs>
<StrategyConfig dsName="hierarchy" enabled="false" useGlobal="true" shouldMonitor="true" shouldEvolve="false" scheduleBySchema="false" timeToLive="1500000" timeToIdle="86400000" updateInterval="1500000" terminalTime="" updateSchema="0 0 8 * * ? *" activeInitiation="false"/>
<StrategyConfig dsName="transaction_details" enabled="false" useGlobal="true" shouldMonitor="true" shouldEvolve="false" scheduleBySchema="false" timeToLive="1500000" timeToIdle="86400000" updateInterval="1500000" terminalTime="" updateSchema="0 0 8 * * ? *" activeInitiation="false"/>
<StrategyConfig dsName="option" enabled="false" useGlobal="true" shouldMonitor="true" shouldEvolve="false" scheduleBySchema="false" timeToLive="1500000" timeToIdle="86400000" updateInterval="1500000" terminalTime="" updateSchema="0 0 8 * * ? *" activeInitiation="false"/>
</StrategyConfigs>
</StrategyConfigsAttr>
<FileAttrErrorMarker class="com.fr.base.io.FileAttrErrorMarker" usable="true" exitTime="10.0" pluginID="com.fr.plugin.bigScreen.v11" autoExit="false" customBackPath="" plugin-version="4.6.1" textContent="" oriClass="com.fr.plugin.chart.openvideo.OpenVideoSettings" customTransPath="" type="style2">
<FRFont name="Arial" style="0" size="256">
<foreground>
<FineColor ver="-1" color="-1" hor="-1"/>
</foreground>
</FRFont>
<GI>
<AttrBackground>
<Background name="ColorBackground">
<color>
<FineColor ver="-1" color="-15329992" hor="-1"/>
</color>
</Background>
<Attr themed="false" autoBackground="false" shadow="false" gradientType="normal">
<gradientStartColor>
<FineColor ver="-1" color="-12146441" hor="-1"/>
</gradientStartColor>
<gradientEndColor>
<FineColor ver="-1" color="-9378161" hor="-1"/>
</gradientEndColor>
</Attr>
</AttrBackground>
<AttrBorder>
<Attr lineStyle="0" roundRadius="0" isRoundBorder="false"/>
<newColor themed="false" autoColor="false">
<borderColor>
<FineColor ver="-1" color="-16777216" hor="-1"/>
</borderColor>
</newColor>
</AttrBorder>
<AttrAlpha>
<Attr alpha="1.0"/>
</AttrAlpha>
</GI>
</FileAttrErrorMarker>
<NewFormMarkAttr class="com.fr.form.fit.NewFormMarkAttr">
<NewFormMarkAttr type="1" tabPreload="true" fontScaleFrontAdjust="true" supportColRowAutoAdjust="true"/>
</NewFormMarkAttr>
<TemplateCloudInfoAttrMark class="com.fr.plugin.cloud.analytics.attr.TemplateInfoAttrMark" pluginID="com.fr.plugin.cloud.analytics.v11" plugin-version="3.7.0.20220804">
<TemplateCloudInfoAttrMark createTime="1660695034764"/>
</TemplateCloudInfoAttrMark>
<TemplateIdAttMark class="com.fr.base.iofile.attr.TemplateIdAttrMark">
<TemplateIdAttMark TemplateId="c8984926-2db5-417b-8731-ac763b1947f1"/>
</TemplateIdAttMark>
</Form>
