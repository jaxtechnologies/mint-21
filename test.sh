PS3="Select the conky file to use: "

install_path=$(pwd)

clear
echo ""
echo ""

select opt in vm e6530 macpro quit; do

  case $opt in
    vm)
      cp $install_path/.conkyrc_vm ~/.conkyrc
      break
      ;;
    e6530)
      cp $install_path/.conkyrc_e6530 ~/.conkyrc
      break
      ;;
    macpro)
      cp $install_path/.conkyrc_macpro ~/.conkyrc
      break
      ;;
    quit)
      break
      ;;
    *)
      echo "Invalid option $REPLY"
      ;;
  esac
done
