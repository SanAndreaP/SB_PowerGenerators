function init()
  entity.setInteractive(entity.configParameter("interactive", true) and not (entity.inboundNodeCount() > 0 and entity.isInboundNodeConnected(0)))

  if storage.state == nil then
    storage.state = entity.configParameter("defaultState", true);
  end

  updateAnimationState(storage.state)

  if entity.outboundNodeCount() > 0 then
    entity.setOutboundNodeLevel(0, storage.state)
  end

  script.setUpdateDelta(0);
end

function onInteraction(args)
  output(not storage.state)
end

function onNodeConnectionChange(args)
  entity.setInteractive(entity.configParameter("interactive", true) and not entity.isInboundNodeConnected(0))
end

function onInboundNodeChange(args)
  output(entity.getInboundNodeLevel(0))
end

function output(state)
  if state ~= storage.state then
    storage.state = state
    updateAnimationState(storage.state)
    if entity.outboundNodeCount() > 0 then
      entity.setOutboundNodeLevel(0, storage.state)
    end
  end
end

function updateAnimationState(state)
  if state then
    entity.setAnimationState("switchState", "on")
    entity.setSoundEffectEnabled(true)
    if not (entity.configParameter("alwaysLit")) then entity.setLightColor(entity.configParameter("lightColor", {0, 0, 0, 0})) end
    entity.playSound("on");
  else
    entity.setAnimationState("switchState", "off")
    entity.setSoundEffectEnabled(false)
    if not (entity.configParameter("alwaysLit")) then entity.setLightColor({0, 0, 0, 0}) end
    entity.playSound("off");
  end
end
