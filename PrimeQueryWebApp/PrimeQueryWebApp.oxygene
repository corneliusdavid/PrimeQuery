<?xml version="1.0" encoding="utf-8"?>
<Project DefaultTargets="Build" xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="4.0">
  <PropertyGroup>
    <ProductVersion>3.5</ProductVersion>
    <ProjectGuid>{6d86d318-8f9a-443e-8024-e2be6d1a8031}</ProjectGuid>
    <ProjectTypeGuids>{349c5851-65df-11da-9384-00065b846f21};{656346D9-4656-40DA-A068-22D5425D4639}</ProjectTypeGuids>
    <OutputType>library</OutputType>
    <RootNamespace>PrimeQueryWebApp</RootNamespace>
    <AssemblyName>PrimeQueryWebApp</AssemblyName>
    <Configuration Condition="'$(Configuration)' == ''">Release</Configuration>
    <TargetFrameworkVersion>v4.5</TargetFrameworkVersion>
    <IISExpressUseClassicPipelineMode>true</IISExpressUseClassicPipelineMode>
    <Name>PrimeQueryWebApp</Name>
    <UseIISExpress>true</UseIISExpress>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Debug' ">
    <DefineConstants>DEBUG;TRACE;</DefineConstants>
    <OutputPath>./bin</OutputPath>
    <GeneratePDB>True</GeneratePDB>
    <GenerateMDB>True</GenerateMDB>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <PropertyGroup Condition=" '$(Configuration)' == 'Release' ">
    <OutputPath>./bin</OutputPath>
    <EnableAsserts>False</EnableAsserts>
    <WarnOnCaseMismatch>True</WarnOnCaseMismatch>
  </PropertyGroup>
  <ItemGroup>
    <Reference Include="mscorlib">
      <HintPath>$(Framework)\mscorlib.dll</HintPath>
    </Reference>
    <Reference Include="System" />
    <Reference Include="System.Configuration" />
    <Reference Include="System.Data" />
    <Reference Include="System.Drawing" />
    <Reference Include="System.EnterpriseServices" />
    <Reference Include="System.Web" />
    <Reference Include="System.Web.Mobile" />
    <Reference Include="System.Web.Services" />
    <Reference Include="System.Xml" />
    <Reference Include="System.Core">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Xml.Linq">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
    <Reference Include="System.Data.DataSetExtensions">
      <RequiredTargetFramework>3.5</RequiredTargetFramework>
    </Reference>
  </ItemGroup>
  <ItemGroup>
    <Content Include="Default.aspx" />
    <Compile Include="Default.aspx.pas">
      <DependentUpon>Default.aspx</DependentUpon>
    </Compile>
    <Compile Include="Default.aspx.designer.pas">
      <DependentUpon>Default.aspx</DependentUpon>
    </Compile>
    <Content Include="Global.asax" />
    <Compile Include="Global.asax.pas">
      <DependentUpon>Global.asax</DependentUpon>
    </Compile>
    <Content Include="PrimeQueryStyle.css">
      <SubType>Content</SubType>
    </Content>
    <Content Include="Web.config" />
    <Compile Include="Properties\AssemblyInfo.pas" />
    <None Include="Web.Release.config">
      <SubType>Content</SubType>
      <DependentUpon>Web.config</DependentUpon>
    </None>
    <None Include="Web.Debug.config">
      <SubType>Content</SubType>
      <DependentUpon>Web.config</DependentUpon>
    </None>
  </ItemGroup>
  <ItemGroup>
    <Folder Include="Properties\" />
  </ItemGroup>
  <ProjectExtensions>
    <VisualStudio>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}">
        <WebProjectProperties>
          <UseIIS>True</UseIIS>
          <AutoAssignPort>True</AutoAssignPort>
          <DevelopmentServerPort>49514</DevelopmentServerPort>
          <DevelopmentServerVPath>/</DevelopmentServerVPath>
          <IISUrl>http://localhost:49514/</IISUrl>
          <NTLMAuthentication>False</NTLMAuthentication>
          <UseCustomServer>False</UseCustomServer>
          <CustomServerUrl>
          </CustomServerUrl>
          <SaveServerSettingsInUserFile>False</SaveServerSettingsInUserFile>
        </WebProjectProperties>
      </FlavorProperties>
      <FlavorProperties Guid="{349c5851-65df-11da-9384-00065b846f21}" User="">
        <WebProjectProperties>
          <StartPageUrl>
          </StartPageUrl>
          <StartAction>CurrentPage</StartAction>
          <AspNetDebugging>True</AspNetDebugging>
          <SilverlightDebugging>False</SilverlightDebugging>
          <NativeDebugging>False</NativeDebugging>
          <SQLDebugging>False</SQLDebugging>
          <ExternalProgram>
          </ExternalProgram>
          <StartExternalURL>
          </StartExternalURL>
          <StartCmdLineArguments>
          </StartCmdLineArguments>
          <StartWorkingDirectory>
          </StartWorkingDirectory>
          <EnableENC>True</EnableENC>
          <AlwaysStartWebServerOnDebug>True</AlwaysStartWebServerOnDebug>
        </WebProjectProperties>
      </FlavorProperties>
    </VisualStudio>
  </ProjectExtensions>
  <Import Project="$(MSBuildExtensionsPath)\RemObjects Software\Oxygene\RemObjects.Oxygene.Echoes.targets" />
  <Import Project="$(MSBuildExtensionsPath)\Microsoft\VisualStudio\v12.0\WebApplications\Microsoft.WebApplication.targets" />
  <Import Project="..\PrimeShared\PrimeShared.projitems" Label="Shared" />
</Project>