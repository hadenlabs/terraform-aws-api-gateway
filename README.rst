|license|

:Version: 0.1.1
:Web: https://github.com/hadenlabs/terraform-aws-api-gateway
:Download: https://github.com/hadenlabs/terraform-aws-api-gateway
:Source: https://github.com/hadenlabs/terraform-aws-api-gateway
:Keywords: terraform-aws-api-gateway

.. contents:: Table of Contents:
    :local:

Terraform Aws Lambda
====================


Usage
*****

The module works in two distinct modes:

Include this repository as a module in your existing terraform code:

.. code-block::

    module "api-gateway" {
        source      = "git::https://github.com/hadenlabs/terraform-aws-api-gateway.git?ref=tags/0.1.1"
        name        = "${var.name}"
        namespace   = "${var.namespace}"
        stage       = "${var.stage}"
        rest_api_id = "${var.rest_api_id}"
        resource_id = "${var.resource_id}"
        method      = "${var.method}"
        path        = "${var.path}"
        lambda      = "${var.lambda}"
        region      = "${var.region}"
        account_id  = "${var.account_id}"
    }


Variables
---------

+------------+------------+-----------------------------------------------------------+----------+
| Name       | Default    | Description                                               | Required |
+============+============+===========================================================+==========+ 
| namespace  | hadenlabs  | Namespace (e.g. hd or hadenlabs)                          | Yes      |
+------------+------------+-----------------------------------------------------------+----------+
| stage      | dev        | Stage (e.g. prod, dev, staging)                           | Yes      |
+------------+------------+-----------------------------------------------------------+----------+
| name       | name       | The Name of the application(e.g. `notification` or `call`)| Yes      |
+------------+------------+-----------------------------------------------------------+----------+
| rest_api_id|            | The ID of the associated REST API                         | Yes      |
+------------+------------+-----------------------------------------------------------+----------+
| resource_id|            | The API resource ID                                       | Yes      |
+------------+------------+-----------------------------------------------------------+----------+
| method     |            | The HTTP method                                           | Yes      |
+------------+------------+-----------------------------------------------------------+----------+
| path       |            | The API resource path                                     | Yes      |
+------------+------------+-----------------------------------------------------------+----------+
| lambda     |            | The lambda name to invoke                                 | Yes      |
+------------+------------+-----------------------------------------------------------+----------+
| region     |            | The AWS region, e.g., eu-west-1                           | Yes      |
+------------+------------+-----------------------------------------------------------+----------+
| account_id |            | The AWS account ID                                        | Yes      |
+------------+------------+-----------------------------------------------------------+----------+


License
*******

Apache 2 License. See `LICENSE_` for full details.

Changelog
*********

Please see `CHANGELOG`_ for more information what
has changed recently.

Contributing
************

Please see `CONTRIBUTING`_ for details.


Versioning
**********

Releases are managed using github release feature. We use [Semantic Versioning](http://semver.org) for all
the releases. Every change made to the code base will be referred to in the release notes (except for
cleanups and refactorings).

Credits
*******

-  `CONTRIBUTORS`_

Made with :heart: ️:coffee:️ and :pizza: by `company`_.

.. |license| image:: https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square
  :target: LICENSE
  :alt: License

.. Links
.. _`CHANGELOG`: CHANGELOG.rst
.. _`CONTRIBUTORS`: AUTHORS.rst
.. _`CONTRIBUTING`: CONTRIBUTING.rst
.. _`LICENSE`: LICENSE


.. _`company`: https://github.com/hadenlabs
.. dependences
.. _`Python 3.6.4`: https://www.python.org/downloads/release/python-364
.. _`Docker`: https://www.docker.com/
.. _`Docker Compose`: https://docs.docker.com/compose/

