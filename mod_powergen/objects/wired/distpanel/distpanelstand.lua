function init()
  if entity.outboundNodeCount() > 0 then
    entity.setOutboundNodeLevel(0, storage.state)
  end
  if entity.outboundNodeCount() > 1 then
    entity.setOutboundNodeLevel(1, storage.state)
  end
  
  output(entity.getInboundNodeLevel(0));

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
	
	local dir = entity.direction();
	
    if state then
	  if dir < 0 then
	    entity.setAnimationState("switchState", "onl")
	  else
	    entity.setAnimationState("switchState", "onr")
	  end
    else
	  if dir < 0 then
	    entity.setAnimationState("switchState", "offl")
	  else
	    entity.setAnimationState("switchState", "offr")
	  end
    end
  end
end
