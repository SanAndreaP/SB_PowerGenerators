function init()
  if entity.outboundNodeCount() > 0 then
    entity.setOutboundNodeLevel(0, storage.state)
  end
  if entity.outboundNodeCount() > 1 then
    entity.setOutboundNodeLevel(1, storage.state)
  end
  
  output(entity.getInboundNodeLevel(0))

  script.setUpdateDelta(0)
end

function onInboundNodeChange(args)
  output(entity.getInboundNodeLevel(0))
end

function output(state)
  if state ~= self.state then
    self.state = state
    entity.setOutboundNodeLevel(0, state)
    entity.setOutboundNodeLevel(1, state)
	
    if state then
	  entity.setAnimationState("switchState", "on")
    else
	  entity.setAnimationState("switchState", "off")
    end
  end
end
