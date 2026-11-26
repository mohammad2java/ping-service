## Ping Service
----------------------
We have 2 work in this repo.
-----------------------------
1) build docker image and push it to docker hub [using github actions]
2) deploy the ping service in kubernetes cluster using argocd[helm]
 --- to deploy in argocd , you need to have argocd installed in your cluster and you need to login to argocd ui using admin user and password.
 to setup argocd in your cluster, checkout project -> argocd-deployment-poc




1. Took complete ownership of designing and developing the BDM ETL Tool from scratch. Independently handled the design, development, and implementation of almost all components except the ETL Dashboard.

2. Understood the existing legacy systems (COMBO, FA, and LMT), their database models, table structures, and business flows to ensure correct data extraction and migration to the target FIS CLS system.

3. Designed a flexible and configurable mapping framework to map legacy system data to the target CLS data model without depending on hardcoded logic.

4. Developed a common job that can extract data from any legacy database table into the BDM Tool Database using only a few configurations. This reduced repetitive coding and made the extraction process reusable.

5. Worked on multiple technical POCs to identify and validate the best solutions required for building the BDM ETL Tool. Also shared the POC results and conducted KT sessions with the team.

6. Learned commercial loan business concepts and processes to understand the requirements and design the appropriate data models for the BDM Tool.

7. Took the initiative to automate database schema creation and master data management using Liquibase, making database changes easier to manage across different environments.

8. Researched and compared different Java Excel libraries and identified EasyExcel as a suitable option for template-based Excel generation based on project requirements and performance.

9. Designed and developed a generic Excel generation component that supports template-based Excel generation and handles large datasets containing lakhs of records. Tested it with large volumes of data to ensure reliable performance.

10. Implemented the CACIB logging pattern to standardize application logging and maintain consistency with client logging standards.

11. Regularly supported Business Analysts by providing required legacy data and technical inputs to help them define business rules and prepare data mapping details in FS sheets.

12. Proactively raised questions with Business Analysts to clarify requirements and identify missing details before starting development, reducing the chances of rework.

13. Created a common HTTP file to download all required DUS sheets in a single click, reducing manual effort and saving time.

14. Developed a generic DUS generation component to generate static-data templates dynamically, which reduced manual template creation and saved development time.

15. Conducted multiple KT sessions and feature demonstrations to explain POCs, new components, technical implementations, and functionalities to the team.

16. Conducted proper KT sessions before planned block leave to ensure that team members had the required knowledge to handle the developed components and maintain project continuity.

17. Focused on developing common, reusable, configurable, and maintainable components to avoid duplicate code and make future enhancements easier.

18. Demonstrated strong technical ownership by independently handling major development activities, solving technical challenges, taking initiatives, and collaborating with BAs and team members to successfully build the BDM ETL Tool.






Based on your previous contributions and the appraisal categories shown in the image, here are simple, professional comments suitable for a Senior Technical Engineer appraisal.

**1. Quality of Work – Rating: 4**

Consistently delivered quality work with a focus on reusable, configurable, and maintainable solutions. Developed major components of the BDM ETL Tool from scratch and ensured proper testing, including handling large datasets containing lakhs of records. Focused on understanding requirements before implementation, following coding standards, and delivering reliable solutions. Also took initiatives to improve existing processes through automation and technical improvements.

**2. Collaboration Within the Team – Rating: 4**

Actively collaborated with team members and Business Analysts to understand requirements, resolve technical queries, and provide the required legacy data for business-rule development and mapping activities. Conducted multiple KT sessions, technical demonstrations, and feature walkthroughs to share knowledge about newly developed components and POCs. Also ensured proper knowledge transfer before planned block leave to maintain project continuity and help the team work independently.

**3. Attitudes / Mindset – Rating: 4**

Maintained a positive and proactive approach towards work and took ownership of assigned responsibilities. Always focused on finding better technical solutions and took initiatives in areas like Liquibase automation, generic Excel generation, DUS automation, and reusable database extraction jobs. Showed willingness to learn new business concepts, explore new technologies, take up challenges, and support team members whenever required. Focused on continuous improvement and successful project delivery.

My suggestion: These comments are appropriate for a rating of 4 because they demonstrate consistent delivery, ownership, collaboration, and initiative without sounding exaggerated.



Based on your BDM ETL Tool development work and the appraisal details shared earlier, below are comments for the remaining fields in simple, professional technical English.

**1. Transverse Contributions – Rating: 3**

Contributed beyond regular development activities by supporting Business Analysts with legacy data analysis, sharing technical knowledge, and helping the team understand business and technical requirements. Conducted multiple KT sessions and feature demonstrations to share knowledge about POCs and newly developed components. Also developed common utilities and automation components that reduced manual effort and improved overall team productivity.

**2. Strengths**

Strong technical ownership, problem-solving skills, and the ability to independently design and develop solutions from scratch. Good understanding of Java, Spring Boot, database concepts, and legacy system integration. Focused on building reusable, configurable, and scalable components. Proactive in identifying improvement areas, exploring new technologies, and supporting team members and Business Analysts.

**3. Areas of Improvement**

Focus on improving architectural design skills and gaining deeper knowledge of commercial lending and banking domain concepts. Improve technical documentation and design discussions to make solutions easier for other team members to understand and maintain. Also, work towards taking more responsibility in technical planning and guiding other developers.

**4. Training Needs**

Advanced training on system architecture, microservices design, performance optimization, and cloud technologies. Further learning on commercial lending business processes, FIS CLS, and ETL architecture would help improve domain knowledge. Also interested in exploring AI-assisted development and automation tools to improve development productivity.

My suggestion: Keep the improvement areas and training needs positive. They should show your willingness to grow from an independent senior developer towards a stronger technical lead/architect role.



