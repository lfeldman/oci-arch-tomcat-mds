## Copyright © 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

# Get list of availability domains
data "oci_identity_availability_domains" "ADs" {
  compartment_id = var.tenancy_ocid
}

# Get the latest Oracle Linux image
data "oci_core_images" "InstanceImageOCID" {
  compartment_id           = var.compartment_ocid
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version

  filter {
    name   = "display_name"
    values = ["^.*Oracle[^G]*$"]
    regex  = true
  }
}

#Get list of MySQL configuration
data "oci_mysql_mysql_configurations" "mds_mysql_configurations" {
    compartment_id = var.compartment_ocid

}

# output "yyy" {
#   value = data.oci_identity_availability_domains.ADs.availability_domains #[0]["name"]
# }

# output "zzz" {
#   value = data.oci_mysql_mysql_configurations.mds_mysql_configurations.configurations[0].id
#   # value = data.oci_core_images.InstanceImageOCID.images[0].id
# }