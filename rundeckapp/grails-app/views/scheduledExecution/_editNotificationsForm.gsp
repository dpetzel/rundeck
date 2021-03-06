<%@ page import="rundeck.controllers.ScheduledExecutionController; com.dtolabs.rundeck.plugins.ServiceNameConstants" %>
<g:set var="notifications" value="${scheduledExecution.notifications}"/>
<g:set var="defSuccess" value="${scheduledExecution.findNotification(ScheduledExecutionController.ONSUCCESS_TRIGGER_NAME, ScheduledExecutionController.EMAIL_NOTIFICATION_TYPE)}"/>
<g:set var="isSuccess" value="${params[ScheduledExecutionController.NOTIFY_SUCCESS_RECIPIENTS] && 'true' == params[ScheduledExecutionController.NOTIFY_ONSUCCESS_EMAIL] || null== params[ScheduledExecutionController.NOTIFY_ONSUCCESS_EMAIL] && defSuccess}"/>
<g:set var="defSuccessUrl" value="${scheduledExecution.findNotification(ScheduledExecutionController.ONSUCCESS_TRIGGER_NAME, ScheduledExecutionController.WEBHOOK_NOTIFICATION_TYPE)}"/>
<g:set var="isSuccessUrl" value="${(params[ScheduledExecutionController.NOTIFY_SUCCESS_URL] && 'true' == params[ScheduledExecutionController.NOTIFY_ONSUCCESS_URL]) || (null==params[ScheduledExecutionController.NOTIFY_ONSUCCESS_URL] && defSuccessUrl)}"/>

<g:set var="defFailure" value="${scheduledExecution.findNotification(ScheduledExecutionController.ONFAILURE_TRIGGER_NAME, ScheduledExecutionController.EMAIL_NOTIFICATION_TYPE)}"/>
<g:set var="isFailure" value="${params[ScheduledExecutionController.NOTIFY_FAILURE_RECIPIENTS] && 'true' == params[ScheduledExecutionController.NOTIFY_ONFAILURE_EMAIL] || null == params[ScheduledExecutionController.NOTIFY_ONFAILURE_EMAIL] &&defFailure}"/>
<g:set var="defFailureUrl" value="${scheduledExecution.findNotification(ScheduledExecutionController.ONFAILURE_TRIGGER_NAME, ScheduledExecutionController.WEBHOOK_NOTIFICATION_TYPE)}"/>
<g:set var="isFailureUrl" value="${params[ScheduledExecutionController.NOTIFY_FAILURE_URL] && 'true' == params[ScheduledExecutionController.NOTIFY_ONFAILURE_URL] || null == params[ScheduledExecutionController.NOTIFY_ONFAILURE_URL] &&defFailureUrl}"/>

<g:set var="defStart" value="${scheduledExecution.findNotification(ScheduledExecutionController.ONSTART_TRIGGER_NAME, ScheduledExecutionController.EMAIL_NOTIFICATION_TYPE)}"/>
<g:set var="isStart"
       value="${params[ScheduledExecutionController.NOTIFY_START_RECIPIENTS] && 'true' == params[ScheduledExecutionController.NOTIFY_ONSTART_EMAIL] || null == params[ScheduledExecutionController.NOTIFY_ONSTART_EMAIL] && defStart}"/>
<g:set var="defStartUrl" value="${scheduledExecution.findNotification(ScheduledExecutionController.ONSTART_TRIGGER_NAME, ScheduledExecutionController.WEBHOOK_NOTIFICATION_TYPE)}"/>
<g:set var="isStartUrl"
       value="${params[ScheduledExecutionController.NOTIFY_START_URL] && 'true' == params[ScheduledExecutionController.NOTIFY_ONSTART_URL] || null == params[ScheduledExecutionController.NOTIFY_ONSTART_URL] && defFailureUrl}"/>
<div class="form-group">
    <div class="col-sm-2 control-label text-form-label">
        Send Notification?
    </div>
    <div class="col-sm-10">
        <label class="radio-inline">
            <g:radio value="false" name="notified"
                     checked="${!(notifications || params.notified=='true')}"
                     id="notifiedFalse"/>
            No
        </label>

        <label class="radio-inline">
            <g:radio name="notified" value="true"
                     checked="${notifications || params.notified == 'true'}"
                     id="notifiedTrue"/>
            Yes
        </label>

        <g:javascript>
            <wdgt:eventHandlerJS for="notifiedTrue" state="unempty">
                <wdgt:action visible="true" targetSelector=".notifyFields.form-group"/>
            </wdgt:eventHandlerJS>
            <wdgt:eventHandlerJS for="notifiedFalse" state="unempty">
                <wdgt:action visible="false" targetSelector=".notifyFields.form-group"/>
            </wdgt:eventHandlerJS>
        </g:javascript>
    </div>
</div>
<g:render template="/scheduledExecution/editNotificationsTriggerForm"
    model="${[
            isVisible:( notifications ),
            trigger: ScheduledExecutionController.ONSUCCESS_TRIGGER_NAME,
            triggerEmailCheckboxName: ScheduledExecutionController.NOTIFY_ONSUCCESS_EMAIL,
            triggerEmailRecipientsName: ScheduledExecutionController.NOTIFY_SUCCESS_RECIPIENTS,
            triggerUrlCheckboxName: ScheduledExecutionController.NOTIFY_ONSUCCESS_URL,
            triggerUrlFieldName: ScheduledExecutionController.NOTIFY_SUCCESS_URL,
            isEmail:isSuccess,
            isUrl:isSuccessUrl,
            defEmail:defSuccess,
            defUrl:defSuccessUrl,
            definedNotifications: scheduledExecution.notifications?.findAll{it.eventTrigger== ScheduledExecutionController.ONSUCCESS_TRIGGER_NAME},
            adminauth: adminauth,
            serviceName: ServiceNameConstants.Notification
    ]}"
    />
<g:render template="/scheduledExecution/editNotificationsTriggerForm"
          model="${[
                  isVisible: (notifications),
                  trigger: ScheduledExecutionController.ONFAILURE_TRIGGER_NAME,
                  triggerEmailCheckboxName: ScheduledExecutionController.NOTIFY_ONFAILURE_EMAIL,
                  triggerEmailRecipientsName: ScheduledExecutionController.NOTIFY_FAILURE_RECIPIENTS,
                  triggerUrlCheckboxName: ScheduledExecutionController.NOTIFY_ONFAILURE_URL,
                  triggerUrlFieldName: ScheduledExecutionController.NOTIFY_FAILURE_URL,
                  isEmail: isFailure,
                  isUrl: isFailureUrl,
                  defEmail: defFailure,
                  defUrl: defFailureUrl,
                  definedNotifications: scheduledExecution.notifications?.findAll { it.eventTrigger == ScheduledExecutionController.ONFAILURE_TRIGGER_NAME },
                  adminauth: adminauth,
                  serviceName: ServiceNameConstants.Notification
          ]}"/>

<g:render template="/scheduledExecution/editNotificationsTriggerForm"
          model="${[
                  isVisible: (notifications),
                  trigger: ScheduledExecutionController.ONSTART_TRIGGER_NAME,
                  triggerEmailCheckboxName: ScheduledExecutionController.NOTIFY_ONSTART_EMAIL,
                  triggerEmailRecipientsName: ScheduledExecutionController.NOTIFY_START_RECIPIENTS,
                  triggerUrlCheckboxName: ScheduledExecutionController.NOTIFY_ONSTART_URL,
                  triggerUrlFieldName: ScheduledExecutionController.NOTIFY_START_URL,
                  isEmail: isStart,
                  isUrl: isStartUrl,
                  defEmail: defStart,
                  defUrl: defStartUrl,
                  definedNotifications: scheduledExecution.notifications?.findAll { it.eventTrigger == ScheduledExecutionController.ONSTART_TRIGGER_NAME },
                  adminauth: adminauth,
                  serviceName: ServiceNameConstants.Notification
          ]}"/>
