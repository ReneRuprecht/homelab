resource "openstack_images_image_v2" "debian13cloud" {
  name             = "debian-13-cloud"
  image_source_url = "https://cloud.debian.org/images/cloud/trixie/20260722-2547/debian-13-generic-amd64-20260722-2547.qcow2"
  container_format = "bare"
  disk_format      = "qcow2"
  visibility       = "public"

  properties = {
    hw_qemu_guest_agent = "yes"
  }
}
