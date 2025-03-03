
usage() {
  echo "Usage: $0 {clean_build}"

}

clean_build() {
  cd buildroot
  rm -rf output
  mkdir output
  cd output
  make O=$PWD -C /var/buildroot-2024.11.1 BR2_EXTERNAL=/home/devops/buildroot raspberrypi5_defconfig
  make
}

case "$1" in
  clean_build)
    clean_build
    ;;
  *)
    usage
    exit 1
esac
