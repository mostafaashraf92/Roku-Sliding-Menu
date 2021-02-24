sub init()
  m.itemlabel = m.top.findNode("itemLabel")
  m.transAnimationIn = m.top.findNode("transAnimationIn")
  m.transAnimationOut = m.top.findNode("transAnimationOut")
  m.transAnimationOut.observeField("state", "onTransitionOutAnimationChanged")
  m.isFirstTime = true
end sub

sub showcontent()
  m.transAnimationIn.duration = 0.2
  m.transAnimationOut.duration = 0.2
  itemcontent = m.top.itemContent
  m.itemlabel.text = itemcontent.title
  if not m.isFirstTime
    if m.itemlabel.visible
      startCloseMenuAnimation()
    else
      startOpenMenuAnimation()
    end if
  end if
  m.isFirstTime = false
end sub

sub startOpenMenuAnimation()
  m.itemlabel.visible = true
  m.transAnimationIn.duration = (m.top.rowIndex / 20) + m.transAnimationIn.duration
  m.transAnimationIn.control = "start"
end sub

sub startCloseMenuAnimation()
  m.transAnimationOut.control = "start"
end sub

sub onTransitionOutAnimationChanged()
  if m.transAnimationOut.state = "stopped"
    m.itemlabel.visible = false
  end if
end sub
