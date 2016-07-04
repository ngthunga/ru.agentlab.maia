package ru.agentlab.maia.event;

import ru.agentlab.maia.EventType;

public class AddedRoleEvent extends Event<Object> {

	public AddedRoleEvent(Object role) {
		super(role);
	}

	@Override
	public EventType getType() {
		return EventType.ADDED_ROLE;
	}

}