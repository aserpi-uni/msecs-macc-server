$(document).ready(function() {
    const clientSelect = $("#project_client_id");
    const workspaceSelect = $("#project_workspace_id");

    function propagateSelect(workspaceId) {
        if (workspaceId === "") {
            clientSelect.options = [];
            clientSelect.prop("disabled", "disabled");
            return
        }

        let options = "";
        for(let clientId in workspacesClients[workspaceId]) {
            options += "<option value=" + clientId  + ">" +workspacesClients[workspaceId][clientId] + "</option>"
        }
        clientSelect.html(options);
        clientSelect.prop("disabled", false);
    }

    workspaceSelect.change(function () { propagateSelect(this.value) })
    propagateSelect(workspaceSelect.value)
});
