# Security Model

The model used within the DataGEMS AAI, utilizing the constructs offered by the underpinning Keycloak solution facilitates the authentication and authorization needs of the DataGEMS platform.

Basic constructs include:

* **Clients**: Each of the DataGEMS components is defined as a Keycloak client. If the respective client requires to be able to contact other services on behalf of requesting parties, tit is enabled the token exchange flow.
* **Client Scopes**: For each client, a client scope is created. Individual clients are configured to support available client scopes to be able to control which scopes are available per client. Scope mappers allow the exchange of requested client scopes with access token that contain the respective client as a audience. This way, access tokens generated for specific scopes can be accepted by the respective audience clients.
* **Realm Roles**: At the realm level, we define roles that can be assigned directly to users or through user groups.
* **Client Roles**: At the client level, we define roles that can be assigned directly to users or through user groups.
* **User Groups**: To facilitate the management of the user base, user groups are created to allow easier assignment of roles to users.
* **Context Grants**: To keep available context grants in a central point, special User Groups are created that allow assignment of roles and access levels within specific context.

## Realm Roles

The currently available realm roles include:

* **dg_admin**: Reserved and assigned to adminstrators. If a user has this role associated, they should be able to perform any action.
* **dg_user**: Granted to all users of the platform. This is the base requirement for any authenticated user to utilize the application components. Without this role, the user should not be able to utilize DataGEMS.
* **dg_dataset-uploader**: Reserved and assigned to users that should be able to onboard new datasets to the platform.
* **dg_dataset-curator**: Reserved and assigned to users that should be able to process datasets available in the platform.

More realm level roles may be created to capture more fine grained user categories.

## Client Roles

The currently available client roles include:

* **accounting.admin**: Reserved and assigned to [Accounting Service](https://datagems-eosc.github.io/dg-accounting/) administrators.
* **accounting.user**: Assigned to users that should be able to access the [Accounting Service](https://datagems-eosc.github.io/dg-accounting/) functionality.

More client level roles may be created to capture more fine grained user categories and component requirements.

## Context Roles

To manage assigning access grants with specific context, roles are defined that grant the respective access to the context that they are assigned to. Currently, two context entites are identified:

* **Datasets**: Access grants assigned to a user or user group with a Dataset context, assign the specific access level to the dataset. The currently available dataset context roles include:
    * **dg_ds-browse**: Users with this access level can browse the dataset metadata
    * **dg_ds-delete**: Users with this access level can delete the dataset from the platform
    * **dg_ds-download**: Users with this access level can download the dataset
    * **dg_ds-edit**: Users with this access level can edit the dataset metadata
    * **dg_ds-manage**: Users with this access level can manage the dataset and share it with others
    * **dg_ds-search**: Users with this access level can perform content based search in the dataset
    * **dg_ds-power-search**: Users with this access level can perform advanced content based search in the dataset
* **Collections**: Access grants assigned to a user or user group with a Collection context, assign the specific access level to the collection. The currently available collection context roles include:
    * **dg_col-browse**: Users with this access level can browse the collection
    * **dg_col-delete**: Users with this access level can delete the collection from the platform
    * **dg_col-edit**: Users with this access level can edit the collection metadata
    * **dg_col-manage**: Users with this access level can manage the collection and share it with others

The context roles are defined at the realm level but are only assigned under the context grant groups.

More context level roles may be created to capture more fine grained access categories and component requirements.

## User Groups

The currently configured user groups include:

* **Admins**: members of this group are assigned the realm level dg_admin role
* **Users**: members of this group are assigned the realm level dg_user role

## Context Grant Groups

To manage the context based access grants, user groups are created that allow the assignment of specific access levels to individual users or user groups. The groups are created with a specific hierarchy and metadata that allows the resolution of the context grants and memberhips. The following pattern indicates the hierarchy:

```text
/ctx-grant/<target-principal>/<target-context>
```

The **ctx-grant** prefix helps separate the context grant groups from other groups.

The **target-principal** groups may be a single user or a user group. An attribute in the group helps distinguish the target type. The attribute has the name "target-type" and possible values are **usr** for user or **grp** for groups. In this group we assign the users that we want to be included as the target principals for this access grant. In the case of a user targer, only the specific user is added as a member.

The **target-context** groups may be a single dataset of a collection. An attribute in the group helps distinguish the target type. The attribute has the name "target-type" and possible values are **ds** for dataset or **col** for collection.

In the **target-context** group we assign the context roles that we want to apply to the **target-principal**. In case the target-context is a collection, the possible values are the context roles that apply to collections. If it is a dataset then the possible values are the context roles that apply to datasets.

It must be noted that collections do not propagatge additional access grants to datasets that may belong to the collection. For each dataset, only the dataset target-context assignment define the applying dataset grants.
