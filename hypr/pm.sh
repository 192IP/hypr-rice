#!/bin/bash

# Варианты меню
options="Lock\nLogout\nReboot\nShutdown\nSuspend"

# Показать меню в wofi
selected=$(echo -e "$options" | wofi --dmenu --prompt "Power Menu" --width 200 --height 300)

# Выполнить действие в зависимости от выбора
case $selected in
  "Lock")
    # Команда для блокировки экрана (замените на свою, если используете другой locker)
    i3lock
    ;;
  "Logout")
    # Завершение сеанса (зависит от вашей среды)
    hyprctl dispatch exit
    ;;
  "Reboot")
    # Перезагрузка
    systemctl reboot
    ;;
  "Shutdown")
    # Завершение работы
    systemctl poweroff
    ;;
  "Suspend")
    # Переход в спящий режим
    systemctl suspend
    ;;
  *)
    # Если ничего не выбрано
    exit 1
    ;;
esac
