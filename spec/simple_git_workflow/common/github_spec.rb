require 'spec_helper'
require 'common/github'

describe Github do
  it 'lists repos' do
    github = Github.instance
    github.login
    # expect(github.list_repos.size).to eq(94)
  end

  describe '#create_pull_request', :vcr do
    it 'creates a pull request' do
      instance = Github.instance
      repo = 'workflow-test'
      head, title, body = 'chrisUsick:f3', 'Title for feature01', ''
      allow(instance).to receive(:repo_name).and_return "chrisUsick/#{repo}"
      r = instance.create_pull_request head, title, body
      expect(r.head.label).to match head
      expect(r.title).to match title
      expect(r.body).to match body
      expect(r.base.repo.name).to match repo

    end
  end

  describe '::make_class' do
    it 'makes a method class level' do
      expect(Github.respond_to? :create_pull_request).to be_truthy
    end
  end
end