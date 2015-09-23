package ru.agentlab.maia.context.modifier

import javax.annotation.PostConstruct
import javax.inject.Inject
import ru.agentlab.maia.execution.IExecutionNode
import ru.agentlab.maia.execution.scheduler.sequence.SequenceContextScheduler
import ru.agentlab.maia.memory.IMaiaContext
import ru.agentlab.maia.memory.IMaiaContextInjector

class MaiaBehaviourContextModifier {

	@Inject
	IMaiaContext context

	@PostConstruct
	def void setup() {
		context => [
			putService(IMaiaContext.KEY_TYPE, "behaviour")
			getService(IMaiaContextInjector) => [
				deploy(SequenceContextScheduler, IExecutionNode)
			]
		]
	}
}