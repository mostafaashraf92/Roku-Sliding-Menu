sub init()
  m.rowList = m.top.findNode("list")
  m.rowList.setFocus(true)
  setListContent()
  m.isMenuOpened = false
  m.openMenuAnimation = m.top.FindNode("openMenuAnimation")
  m.closeMenuAnimation = m.top.FindNode("closeMenuAnimation")

end sub

sub setListContent()
  print "##SetListContent"
  m.rowList.content = CreateObject("roSGNode", "RowListContent")
end sub

sub openMenu()
  if not m.isMenuOpened
    m.openMenuAnimation.control = "start"
    m.isMenuOpened = true
    setListContent()
  end if
end sub

sub closeMenu()
  if m.isMenuOpened
    m.closeMenuAnimation.control = "start"
    m.isMenuOpened = false
    setListContent()
  end if
end sub

function onKeyEvent(key, press) as boolean
  if key = "left" and press
    openMenu()
    return true
  else if key = "right" and press and m.rowList.hasFocus()
    closeMenu()
  end if
  return false
end function

