PS3="Select the conky file to use: "

install_path=$(pwd)

select opt in vm e6530 macpro quit; do

  case $opt in
    vm)
      mv $install_path/.conkyrc_vm ~/.conkrc
      ;;
    e6530)
      mv $install_path/.conkyrc_e6530 ~/.conkrc
      ;;
    macpro)
      mv $install_path/.conkyrc_macpro ~/.conkrc   
      ;;
    quit)
      break
      ;;
    *) 
      echo "Invalid option $REPLY"
      ;;
  esac
done
