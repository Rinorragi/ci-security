# Lab52 - Defect Dojo

| Title          | Description                                                         |
| -------------- | ------------------------------------------------------------------- |
| Target         | Read about how to integrate with Defect Dojo                        |
| Difficulty     | Medium                                                              |
| Measure        | Amount of findings                                                  |
| Threat         | Multiple different tools make it hard to keep on track on findings. |
| Detect         | Findings from all the tools                                         |
| Prevent        | Forgot to check that one another tool                               |
| Stage          | Monitor                                                             |
| Known problems | Requires you to run the app on an infrastructure or SaaS offering   |

Once you have implemented various applications you might want to have a dashboard to see the overall situation. There are tools like `SonarQube` that does similar things and complete security solutions offerings also provide the same thing. You could use the `SARIF` way from [lab50](/labs/lab5x-next-steps/lab50-sarif/README.md) to integrate with GitHub list views but it might get short with heavy use.

In this lab we just learn about Defect Dojo and the ways of integrating to it without actually doing (unless you want to host it yourself).

## Check Defect DOJO

1. Check the [live demo of Defect Dojo](https://github.com/DefectDojo/django-DefectDojo#demo)
1. Read about [ways to upload findings](https://docs.defectdojo.com/en/connecting_your_tools/import_intro/)
1. Read about [available parsers](https://docs.defectdojo.com/en/connecting_your_tools/parsers/)
1. Read about [the API](https://docs.defectdojo.com/en/api/api-v2-docs/)
1. Check [Swagger documentation](https://demo.defectdojo.org/api/v2/oa3/swagger-ui/)

## Example solution

This lab was to give you some pointers where to look after this. If you are really enthusiasted you could [run Defect Dojo in Docker and test the functionalities](https://github.com/DefectDojo/django-DefectDojo?tab=readme-ov-file#quick-start-for-compose-v2).

As you can find out there are multiple tools that we already used that could be just integrated to Defect Dojo and the SARIF is also one option.
