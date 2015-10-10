package ru.agentlab.maia.context.modifier

import javax.annotation.PostConstruct
import javax.inject.Inject
import ru.agentlab.maia.memory.IMaiaContext
import ru.agentlab.maia.memory.IMaiaContextInjector
import ru.agentlab.maia.task.ITask
import ru.agentlab.maia.task.ITaskExecutor
import ru.agentlab.maia.task.TaskExecutor
import ru.agentlab.maia.task.sequential.SequentialTaskScheduler

class MaiaContainerContextModifier {

	@Inject
	IMaiaContext context

	@PostConstruct
	def void setup() {
		context => [
			putService(IMaiaContext.KEY_TYPE, "container")
			getService(IMaiaContextInjector) => [
				deploy(SequentialTaskScheduler, ITask)
				deploy(TaskExecutor, ITaskExecutor)
			]
		]
	}
}