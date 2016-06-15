namespace :circleci do
  desc 'Pull the data of the last 10 pushes to CircleCI'
  task :pull => :environment do

    projects = Project.all

    projects.each do |project|
      res = CircleCi::Project.recent_builds_branch 'TruHearing', project.name, 'master'
      res.body.each do |b|
        Build.create(
            project: project,
            build_num: b['build_num'],
            branch: b['branch'],
            committer_name: b['committer_name'],
            subject: b['subject'],
            body: b['body'],
            dont_build: b['dont_build'],
            start_time: b['start_time'],
            stop_time: b['stop_time'],
            build_time_millis: b['build_time_millis'],
            reponame: b['reponame'],
            lifecycle: b['lifecycle'],
            outcome: b['outcome'],
            status: b['status']
        )
      end
    end
  end
end
