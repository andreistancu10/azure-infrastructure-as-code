# azure-infrastructure-as-code
Creating Azure Infrastructure using terraform and Azure Devops Pipelines


1. Create main file for remote terraform file state in azure storage account
2. VNET + subnet + Public IP + NSG 
3. Virtual Machine
4. Variables and Outputs

I pushed all configuration files in Azure Devops:


![image](https://user-images.githubusercontent.com/44494776/155142259-51d3f8b9-65bb-4ad8-9567-e472b7d73697.png)


I created a CI pipeline to copy all terraform files to artifact:
![image](https://user-images.githubusercontent.com/44494776/155142773-3fe011b0-5063-4a05-98eb-b10901ca168c.png)

Build a Release Pipeline using the artifact created previously
![image](https://user-images.githubusercontent.com/44494776/155143127-7b293d5a-32a2-4f40-91b7-45dc358e5329.png)
